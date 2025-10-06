suppressPackageStartupMessages({
  library(dplyr); library(tibble)
})

make_synthetic_population <- function(n, seed = 123) {
  set.seed(seed)
  # TODO: Implement synthetic population generation
  tibble(
    id = 1:n,
    age = sample(20:80, n, replace = TRUE),
    sex = sample(c("M", "F"), n, replace = TRUE),
    race = sample(c("white", "black", "hispanic", "other"), n, replace = TRUE)
  )
}
