data {
  int<lower=1> N;
  real weight[N];
}

parameters {
  real alpha;
  real<lower=0> beta;
}

model {
  alpha ~ normal(170, 10);
  beta ~ lognormal(0, 1);
}

generated quantities {
  real<lower=0> sigma = gamma_rng(2, 30);
  real height_sim[N];
  
  for (i in 1:N) {
    height_sim[i] = normal_rng(alpha + beta * weight[i], sigma);
  }
}