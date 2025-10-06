logit <- function(p) log(p / (1 - p))
inv_logit <- function(x) 1 / (1 + exp(-x))

annualize_from_k_year <- function(p_k, k_years) {
  p_k <- pmin(pmax(p_k, 1e-9), 1 - 1e-9)
  1 - (1 - p_k)^(1 / k_years)
}
