data {
  int<lower=0> N;
  vector[N] alphas;
  vector[N] betas;
}

generated quantities {
  real y[N];
  y = inv_gamma_rng(alphas, betas);
}
