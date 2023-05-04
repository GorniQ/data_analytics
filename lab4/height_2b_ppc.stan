data {
  int<lower=1> N;
  real weight[N];
}


generated quantities {
   real<lower=0> alpha = normal_rng(154, 10);
   real<lower=0> sigma = gamma_rng(1,15);
   real<lower=0> beta = lognormal_rng(0, 1);
   real height[N];
   for (i in 1:N){
    height[i] = normal_rng(weight[i]*beta+alpha, sigma);
   }
}