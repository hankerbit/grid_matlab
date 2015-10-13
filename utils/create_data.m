%% configuration
plot_data = false;
plot_data = true;

%% how I created the list of trials
% trial_directory_info_v3 = dir('needle_master_trials_v3/trial_*');
% trial_directory_info_v4 = dir('needle_master_trials_v4/trial_*');

%% load things

envs = {load_environment('./trials/environment_0.txt'),...
    load_environment('./trials/environment_1.txt'),...
    load_environment('./trials/environment_2.txt'),...
	load_environment('./trials/environment_3.txt'),...
	load_environment('./trials/environment_4.txt'),...
	load_environment('./trials/environment_5.txt'),...
    load_environment('./trials/environment_6.txt'),...
    load_environment('./trials/environment_7.txt'),...
    load_environment('./trials/environment_8.txt'),...
    load_environment('./trials/environment_9.txt'),...
    load_environment('./trials/environment_10.txt'),...
    load_environment('./trials/environment_11.txt'),...
    load_environment('./trials/environment_12.txt'),...
    load_environment('./trials/environment_13.txt')};

%% placeholder because partner gates aren't set up right yet
envs{11}.gates = {{envs{11}.gates{1}{1},envs{11}.gates{2}{1}}};

%% get training data
fprintf('Loading training data...\n');
[trials, predicates] = load_dataset(envs,'./trials/',14);


%% plot data showing levels and trials

if plot_data
    figure(1); clf;
    for sub=1:12
        subplot(4,3,sub);
        draw_environment(envs{sub});
        for i=1:length(trials{sub})
           draw_trial(trials{sub}{i}); 
        end
    end
end
