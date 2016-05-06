rng(100);
%rng(102);
N_ITER = 20;
STEP_SIZE = 0.5;
N_SAMPLES = 200;
N_GEN_SAMPLES = 50*N_SAMPLES;
MAX_OPTIONS = 5;
MAX_PRIMITIVES = 5;

%% solve level one thing at a time
env = envs{11};

% plan ends with an "exit" action and goes to the final exit state
plan = [1 5];
ngates = length(env.gates);

prev_gate = [];
next_gate = [];

if ngates > 0
    
    plan = [2 plan];
    
    prev_gate = ngates;
    next_gate = ngates+1;
    
    if ngates > 1
        for i = 1:(ngates-1)
            plan = [2 3 plan];
            ii = ngates - i;
            prev_gate = [ii ii prev_gate];
            next_gate = [ii+1 ii+1 next_gate ];
        end
    end
    
    % "approach" for the first gate
    plan = [4 plan];
    prev_gate = [0 prev_gate];
    next_gate = [1 next_gate];
end

prev_gate = [prev_gate ngates ngates];
next_gate = [next_gate ngates+1 ngates+1];

trajs = cell(length(plan),1);

%% setup vars for iteration
LEN = length(plan)-1;
ITER = 1;
Zs = cell(LEN,MAX_OPTIONS);

%% initialize options
next_opt = ones(length(next_gate));
prev_opt = ones(length(prev_gate));

%% create parameter search variables
params = zeros(length(env.gates),MAX_OPTIONS);
for i = 1:length(env.gates)
    nopts = length(env.gates{i});
    params(i,1:nopts) = 1 / nopts;
end
nprimitives = ones(MAX_PRIMITIVES,1) / MAX_PRIMITIVES;

%% LOOP
good = 1;
for iter = 1:N_ITER
    figure(1);clf;hold on;
    draw_environment(env);
    x = [190,800,0,0,0]';
    
    config = struct('n_iter',1,'start_iter',iter,'n_primitives',3,'n_samples',N_SAMPLES);
    % randomly choose values for every sample drawn to set up environment
    
    for i = 1:good
        
        param_p = zeros(1,MAX_OPTIONS);
        for j = 1:MAX_OPTIONS

            %fprintf('==============\n');
            %fprintf('ACTION: %d, model=%d, gate=%d, prev_gate=%d\n',i,plan(i),next_gate(i),prev_gate(i));

            current = models{plan(i)};
            goal = models{plan(i+1)};
            config.num_primitives = current.num_primitives;

            if next_gate(i) <= length(env.gates) && params(next_gate(i),j) > 0
                config.n_samples = floor(params(next_gate(i),j) * N_SAMPLES);
            else
                break
            end
            if config.n_samples == 0
                continue
            end

            local_env = [];
            local_env.exit = [env.width; env.height / 2; 0];
            local_env.obstacles = {};
            local_env.gates = env.gates;
            if next_gate(i) <= length(env.gates)
                local_env.gate = env.gates{next_gate(i)}{j};
            end
            if prev_gate(i) > 0
                local_env.prev_gate = env.gates{prev_gate(i)}{prev_opt(i)};
            end
            next_env = [];
            next_env.exit = local_env.exit;
            next_env.obstacles = {};
            next_env.gates = env.gates;
            if next_gate(i+1) <= length(env.gates)
                next_env.gate = env.gates{next_gate(i+1)}{next_opt(i+1)};
            end
            if prev_gate(i+1) > 0
                next_env.prev_gate = env.gates{prev_gate(i+1)}{j};
            end

            [traj,Z,p,pg] = prob_planning(x,current,goal,local_env,next_env,env.surfaces,Zs{i,j},config);
            Zs{i,j} = Z;
            param_p(j) = p;

            %plot(traj(1,:),traj(2,:),colors(plan(i)));

            %x = traj(:,end);
            trajs{i} = traj;

        end
        param_p = param_p / sum(param_p);
        params(i,:) = ((1-(STEP_SIZE/3))*params(i,:)) + ((STEP_SIZE/3)*param_p);
        
        break;
        
    end

    if log(pg) > -10 && good < LEN
        good = good + 1;
    end
    
    M(iter) = getframe(gcf);
end

movie2avi(M, 'options.avi', 'compression', 'None');