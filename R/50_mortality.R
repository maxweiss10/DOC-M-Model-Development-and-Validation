# Placeholder all-cause mortality curve. Replace with CDC WONDER cause-specific tables.
annual_mortality_prob <- function(age, sex, race) {
  pmin(0.0005 * exp((age - 40) / 12), 0.5)
}

apply_mortality <- function(df) {
  p_death <- annual_mortality_prob(df$age, df$sex, df$race)
  df$died <- rbinom(nrow(df), 1, p_death)
  df
}
