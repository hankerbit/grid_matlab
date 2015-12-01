function [ trajs, params, Z, p, pa, pg ] = traj_forward( x0, px0, model, next_model, local_env, next_env, Z, config)
%TRAJ_FORWARD Generate forward samples of an action
%   model is the skill we are using
%   next_model is the following skill
%   env is a representation of the local environment
%   Z is the initial distribution we will refine

%% make sure this is a valid probability distribution
assert(sum(px0) == 1);

%% set up
USE_GOAL = true;
if ~isstruct(next_model)
    fprintf('NOTE: Not using goal.\n');
    USE_GOAL = false;
end
obstacles = local_env.obstacles;

%% set number of iterations to run and other options
if nargin < 8
    start_iter = 1;
    N_PRIMITIVES = model.num_primitives;
    N_SAMPLES = 100;
    good = 1;
else
    start_iter = config.start_iter;
    N_PRIMITIVES = config.n_primitives;
    N_SAMPLES = config.n_samples;
    good = config.good;
end
SHOW_FIGURES = true;
N_Z_DIM = 3*N_PRIMITIVES;
N_GEN_SAMPLES = 50*N_SAMPLES;

%% setup Z
if nargin < 7 || ~isstruct(Z)
    if model.in_gate
        xg = local_env.prev_gate.width;
        local_env.prev_gate.corners
        rg = 0;
    elseif model.use_gate
        %xg = x0(1:2)' - [(local_env.gate.x-(cos(local_env.gate.w)*local_env.gate.width)) local_env.gate.y];
        xg = x0(1:2)' - [local_env.gate.x local_env.gate.y];
        rg = atan2(local_env.gate.y-x0(2),local_env.gate.x-x0(1));
        if rg < -pi
            rg = rg + pi;
        elseif rg > pi
            rg = rg - pi;
        end
    else
        xg = x0(1) - local_env.exit(1);
        rg = 0;
    end
    movement_guess = model.movement_mean;
    N_STEPS = ceil(norm(xg) / N_PRIMITIVES / movement_guess);
    
    rg = rg / (N_STEPS*N_PRIMITIVES) * 20;
    mu = normrnd(1,0.1,N_Z_DIM,1).*repmat([rg;movement_guess;N_STEPS],N_PRIMITIVES,1);
    cv = [model.movement_dev 0 0; 0 model.rotation_dev 0; 0 0 1];
    sigma = eye(N_Z_DIM);
    for i=1:3:N_Z_DIM
        sigma(i:(i+2),i:(i+2)) = cv;
    end
    Z  = struct('mu',mu,'sigma',sigma);
end


%% run
trajs = cell(N_SAMPLES,1);

iter = start_iter;

model_normalizer = 0.1*(0.1^good)*eye(size(model.Sigma,1));
for i = 1:model.nbStates
    model.Sigma(:,:,1) = model.Sigma(:,:,1) + model_normalizer;
end
if USE_GOAL
    goal_normalizer = (0.1^good)*eye(size(next_model.Sigma,1));
    for i = 1:next_model.nbStates
        next_model.Sigma(:,:,1) = next_model.Sigma(:,:,1) + goal_normalizer;
    end
end

samples = mvnsample(Z.mu,Z.sigma,N_GEN_SAMPLES);
params = zeros(size(samples,1),N_SAMPLES);

if SHOW_FIGURES
    figure(iter); hold on;
end

%% INITIALIZE EMPTY VARIABLES
p = zeros(N_SAMPLES,1);
pa = zeros(N_SAMPLES,1);
pg = zeros(N_SAMPLES,1);

%% GENERATE SAMPLES AND COMPUTE PROBABILITIES

sample = 0;
for i = 1:N_GEN_SAMPLES
    p_z = log(mvnpdf(samples(:,i),Z.mu,Z.sigma));
    traj = sample_seq(x0,samples(:,i));
    
    if check_collisions(traj,obstacles) == 0
        
        sample = sample + 1;
        
        trajs{sample} = traj;
        params(:,sample) = samples(:,i);
        
        fa = traj_get_reproduction_features(traj(:,1:end-1),model,local_env);
        len = size(fa,2);
        fa = [1000 * (1:len) / len; fa];
        
        if USE_GOAL
            fg = traj_get_reproduction_features(traj(:,end),next_model,next_env);
            fg = [0;fg];
        end
        
        %% THIS BLOCK IS WHERE WE COMPUTE THE LIKELIHOODS
        %p_action = log(min(exp(compute_loglik(fa,model.Mu,model.Sigma,model,model.in))));%/len;
        p_action = mean(compute_loglik(fa,model.Mu,model.Sigma,model,model.in));%/len;
        %p_action = sum(compute_loglik(fa,model.Mu,model.Sigma,model,model.in))/len;
        
        if USE_GOAL
            p_goal = compute_loglik(fg,next_model.Mu,(next_model.Sigma),next_model,next_model.in); %fg,next_model.Mu,next_model.Sigma);
            %fprintf('%f / %f\n',p_action,p_goal);
            
            p(sample) =  exp(p_action + p_goal);
            pa(sample) = exp(p_action);
            pg(sample) = exp(p_goal);
        else
            p(sample) =  exp(p_action);
            pa(sample) =  exp(p_action);
            pg(sample) = exp(p_action);
        end
        
        if SHOW_FIGURES
            plot(traj(1,:),traj(2,:),'color',model.color);
        end
        
        if sample == N_SAMPLES
            break
        end
    end
end
end


% detect a "bad" trajectory
% these are trajectories that lead to an immediate failure, such as hitting
% an obstacle
function obs = check_collisions(traj,obstacles)
obs = 0;
for i = 1:length(obstacles)
    if ~obstacles{i}.isDeepTissue
        continue
    elseif any(inpolygon(traj(1,:),traj(2,:),obstacles{i}.bounds(1,:),obstacles{i}.bounds(2,:)))
        obs = i;
        break;
    end
end
end

