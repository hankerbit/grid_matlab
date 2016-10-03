function Z = model_init_z(model, config)
    movement_guess = model.movement_mean;
    rotation_guess = model.rotation_mean;
    n_steps = 10;
    
    assert (config.n_primitive_params == 3);
    n_z_dim = config.n_primitives * config.n_primitive_params;
    
    mu = normrnd(1,0.1,n_z_dim,1).*repmat([rotation_guess;movement_guess;n_steps],config.n_primitives,1);
    cv = [model.movement_dev 0 0; 0 0.1*model.rotation_dev 0; 0 0 1];
    sigma = eye(n_z_dim);
    for i=1:3:n_z_dim
        sigma(i:(i+2),i:(i+2)) = cv;
    end
    Z  = struct('mu',mu,'sigma',sigma);
end