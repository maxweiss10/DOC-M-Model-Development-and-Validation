apply_aom_effects_year1 <- function(weight_kg, diabetes, aom, aom_effects) {
  group <- ifelse(diabetes == 1, "diabetes", "non_diabetes")
  effs <- aom_effects[[group]][[aom]]
  pct <- effs$mean_pct / 100
  weight_kg * (1 + pct)
}

apply_aom_effects_maintenance <- function(weight_kg, diabetes, aom, aom_effects, years_on_tx) {
  # Placeholder for maintenance phase (years 2+)
  # TODO: Model weight regain or sustained effect
  weight_kg
}
