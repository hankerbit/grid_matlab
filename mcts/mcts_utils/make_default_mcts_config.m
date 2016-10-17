function config = make_default_mcts_config()
    config = struct('update',0, ...
                    'dist',0, ...
                    'select',0, ...
                    'compute_metric', @(obj) metric_probability_max(obj), ...
                    'compute_rollout_metric', @(obj) metric_probability(obj), ...
                    'draw_figures', true, ...
                    'init_samples', 10);
end