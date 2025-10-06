validate_weight <- function(sim_results, aom_effects) {
  sim_results %>%
    dplyr::group_by(treat, year) %>%
    dplyr::summarize(
      mean_bmi = mean(bmi, na.rm = TRUE),
      mean_weight = mean(weight_kg, na.rm = TRUE),
      .groups = "drop"
    )
}

validate_diabetes_incidence <- function(sim_results) {
  sim_results %>%
    dplyr::filter(year > 0, diabetes == 1) %>%
    dplyr::group_by(treat, year) %>%
    dplyr::summarize(
      n_new_diabetes = dplyr::n(),
      .groups = "drop"
    )
}

validate_ascvd_incidence <- function(sim_results) {
  sim_results %>%
    dplyr::filter(year > 0, cvd_history == 1) %>%
    dplyr::group_by(treat, year) %>%
    dplyr::summarize(
      n_new_ascvd = dplyr::n(),
      .groups = "drop"
    )
}
