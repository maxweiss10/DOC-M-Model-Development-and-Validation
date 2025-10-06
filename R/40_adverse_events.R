sample_adverse_events <- function(n, aom, aom_effects) {
  probs <- aom_effects$adverse_events[[aom]]
  if (is.null(probs)) return(matrix(FALSE, nrow = n, ncol = 0))
  as.data.frame(lapply(probs, function(p) rbinom(n, 1, p) == 1))
}

discontinuation_prob <- function(df, aom, aom_effects) {
  # Placeholder for discontinuation probability based on AEs, weight response, etc.
  rep(0.1, nrow(df))
}
