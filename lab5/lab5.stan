data {
  int<lower=0> N; // Number of data points
  int<lower=0> years[N]; // Years
  int<lower=0> accidents[N]; // Number of accidents
  real<lower=0> miles[N]; // Miles flown
}

parameters {
  real alpha; // Intercept
  real theta; // Slope for miles
}

model {
  // Priors
  alpha ~ normal(0, 5);
  theta ~ normal(0, 1);

  // Likelihood
  for (i in 1:N) {
    accidents[i] ~ poisson(exp(alpha + theta * miles[i])); // Poisson likelihood with log link function
  }
}

generated quantities {
  // Prior predictive distribution
  int<lower=0> accidents_prior[N]; // Prior predictive accidents
  for (i in 1:N) {
    accidents_prior[i] = poisson_rng(exp(alpha + theta * miles[i])); // Generate prior predictive accidents
  }
}