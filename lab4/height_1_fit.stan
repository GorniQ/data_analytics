data {
  int<lower=0> N;
  real<lower=0> heights[N];
}

parameters {
  real<lower=0> mi;
  real<lower=0> sigma;
}

model {
  mi ~ normal(154, 10);
  sigma ~ gamma(1, 15);
  heights ~ normal(mi, sigma);
}

generated quantities {
   real<lower=0> height_sim = normal_rng(mi, sigma);
}

