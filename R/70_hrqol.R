# Placeholder HRQOL. Replace with Lubetkin et al. model using coeff_hrqol.
hrqol_baseline <- function(df, coeff_hrqol) {
  u <- 0.88 - 0.0015 * pmax(df$age - 40, 0)
  u <- u - 0.05 * df$diabetes - 0.08 * df$cvd_history
  pmax(pmin(u, 1), 0)
}

hrqol_with_events <- function(df, coeff_hrqol, params) {
  u <- hrqol_baseline(df, coeff_hrqol)
  # Apply disutilities for acute events
  u <- u - 0.1 * df$incident_mi - 0.15 * df$incident_stroke
  pmax(pmin(u, 1), 0)
}
