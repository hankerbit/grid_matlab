function config = make_default_action_config()
config = struct('n_iter', 1, ...
            'start_iter', 1, ...
            'elite_set', 4, ... % if > 1, use elite set instead of weights
            'n_primitives', 1, ...
            'max_primitives', 5, ...
            'allow_repeat', false, ...
            'n_primitive_params', 3, ...
            'n_samples', 100, ...
            'step_size', 0.75, ...
            'good', 12, ...
            'show_figures', false, ...
            'max_depth', 7, ...
            'rollout_depth', 1, ...
            'weighted_sample_starts', true, ... % sample from best or rollout all
            'draw', 'mvn', ... % mvn or uniform
            'initialization', 'env', ... env or demo
            'fixed_num_primitives', true);
end