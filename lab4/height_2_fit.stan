data {
    int<lower=0> N;
    real<lower=0> heights[N];
    real weight[N];
}

parameters {
   real alpha;
   real<lower=0> sigma;
   real beta;
}

transformed parameters {
   real mi[N];
    for (i in 1:N){
        mi[i] = beta*weight[i] + alpha;
    }
}

model{
   alpha ~ normal(154, 10);
   sigma ~ gamma(1, 15);
   beta ~ lognormal(0,1);

   for (i in 1:N) {
      heights[i] ~ normal(mi[i], sigma);
    }
}

generated quantities {
   real h[N];
    for (i in 1:N) {
        h[i] = normal_rng(mi[i], sigma);
    }
}