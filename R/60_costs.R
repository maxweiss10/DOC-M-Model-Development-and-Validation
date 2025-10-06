# Placeholder cost functions. Replace with MEPS-based 2-stage model and event costs from params.
annual_healthcare_cost <- function(df, params) {
  base <- 3000
  base + 500 * df$diabetes + 1200 * df$cvd_history
}

event_costs <- function(df, params) {
  # Placeholder for acute event costs (MI, stroke, revascularization, etc.)
  cost <- rep(0, nrow(df))
  cost[df$incident_mi == 1] <- 10000
  cost[df$incident_stroke == 1] <- 15000
  cost
}
