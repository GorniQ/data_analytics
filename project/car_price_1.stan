data {
  int<lower=0> N;  // Number of data points
  vector[N] x1;    // Predictor variable 1 (mileage)
  vector[N] x2;    // Predictor variable 2 (production year)
  vector[N] y;     // Target variable (price)
}

parameters {
  real alpha;      // Intercept
  real beta1;      // Coefficient for predictor variable 1
  real beta2;      // Coefficient for predictor variable 2
  real<lower=0> sigma;  // Error term standard deviation
}

model {
  // Priors
  alpha ~ normal(30000, 1000);
  beta1 ~ normal(200000, 1000);
  beta2 ~ normal(2010, 2);
  sigma ~ normal(0, 10);
  
  // Likelihood
  y ~ normal(alpha + beta1 * x1 + beta2 * x2, sigma);
}