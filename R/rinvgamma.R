.get_stan_model <- function(name) {
  fn0 <- sprintf("%s.stan", name)
  fn1 <- system.file(fn0, package = "rstaninvgamma")
  mod <- rstan::stan_model(
    file       = fn1,
    save_dso   = FALSE,
    verbose    = FALSE,
    auto_write = FALSE)

  return(mod)
}

.evaluate_stan_model <- function(model, data, seed) {
  if (is.null(seed))
    seed <- sample.int(.Machine$integer.max, 1)

  rstan::sampling(
    object = model,
    data   = data,
    seed   = seed,
    iter   = 1,
    warmup = 0,
    chains = 1,
    algorithm = "Fixed_param"
  )
}

rinvgamma <- function(n, alpha, beta, seed = NULL) {
  N      <- n
  alphas <- rep(alpha, N)
  betas  <- rep(beta,  N)
  dataLs <- list(N = N, alphas = alphas, betas = betas)

  mod <- .get_stan_model("rinvgamma")
  rng <- .evaluate_stan_model(mod, dataLs, seed)
  out <- drop(rstan::extract(rng, "y")[[1]])
  return(out)
}
