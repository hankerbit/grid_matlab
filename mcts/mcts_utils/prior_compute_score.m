function score = prior_compute_score(sum, nb, p, t, C)
    score = (sum / (nb + 1)) + (C * p * sqrt(t)/(nb + 1));
end