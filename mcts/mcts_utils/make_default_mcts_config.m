function config = make_default_mcts_config()
    C = 4;
    alpha = 0.2;
    compute_score = @(sum, nb, t) pw_compute_score(sum, nb, t, C, alpha); 
    config = struct('update', 0, ...
                    'dist', 0, ...
                    'select', 0, ...
                    'backup', @(iter, nodes, trace, max_depth) default_backup(iter, nodes, trace, max_depth, compute_score), ...
                    'compute_metric', @(obj) metric_probability_max(obj), ...
                    'compute_rollout_metric', @(obj) metric_probability(obj), ...
                    'draw_figures', true, ...
                    'init_samples', 4, ...
                    'initialization', 'pw');
end