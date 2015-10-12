function [labels,probs,z] = HmmAssign(bmm,data,prev_label)


len = size(data,1);
D = size(data, 2);

z = zeros(len,bmm.k);
%repmat(p(:,1)',len,1)

if prev_label == 0
    prior = bmm.T0;
else
    prior = bmm.T(prev_label,:);
end

%% Expectation step
% compute expected values for each one
for k=1:bmm.k
    
    p_inv = ones(size(bmm.coef)) - bmm.coef;
    
    p_tmp = repmat(bmm.coef(:,k)',len, 1);
    p_inv_tmp = repmat(p_inv(:,k)',len, 1);
    
    tmp = zeros(len, D);
    tmp(data==1) = p_tmp(data==1);
    tmp(data==0) = p_inv_tmp(data==0);
    
    z(:,k) = prior(k) * prod(tmp')';
end

Z = sum(z,2);
z = z ./ Z(:,ones(bmm.k,1));

[probs,labels] = max(z');
