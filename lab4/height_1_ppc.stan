generated quantities {
  real mi = normal_rng(170, 10);//chosen 170cm as reasonable mean height of a human, amd standard deviation of 10cm
  real<lower=0> sigma = gamma_rng(2, 30);
  real height_sim = normal_rng(mi, sigma + 15);
}