# DOC-M (Diabetes, Obesity, Cardiovascular Disease Microsimulation) – Replication Scaffold

This repository provides a reproducible scaffold to replicate the DOC-M model in R as described in the eMethods:
- Individual-level microsimulation
- Annual transitions for diabetes, first ASCVD, second ASCVD, mortality
- Weight and cardiometabolic risk factor dynamics under lifestyle and AOMs (semaglutide, tirzepatide, naltrexone/bupropion, phentermine/topiramate)
- Health-related quality of life (HRQOL), direct medical costs, productivity costs
- Validation vs. trial ITT weight and risk factor changes
- Scenario analysis and probabilistic sensitivity analysis (PSA)

Original DOC-M: https://github.com/food-price/DOC-M-Model-Development-and-Validation

## Requirements

- R 4.1.x (as in the original model) recommended; newer R versions should work if dependencies resolve
- Suggested: `renv` to lock the environment
- Packages: see `install_packages.R` or use `renv::restore()`

## Data sources you will need

1) NHANES 1999–2016 (demographics, labs, exam, questionnaire) to build baseline population with weights
2) MEPS 2016–2020 (for 2-stage cost models; health care cost predictions and event costs)
3) CDC WONDER (2012–2016 cause-specific mortality by age, sex, race/ethnicity groups)
4) Trial inputs (ITT effects and discontinuation/adverse event rates) – included in `config/params.yaml` and `config/aom_effects.yaml`
5) Risk model coefficients (CSV placeholders provided under `config/coefficients/`) for:
   - ACC/AHA Pooled Cohort Equations (10-year ASCVD; convert to annual)
   - Framingham Offspring Study (8-year diabetes incidence; convert to annual)
   - Framingham recurrent CHD (2-year risk; convert to annual)
   - HRQOL prediction model (Lubetkin et al.)

You may already have these coefficients; if not, populate the CSVs from the cited sources.

## Quick start

1. Clone the repo.
2. Install dependencies:
   - Option A: `renv::init()` then `renv::restore()` (if `renv.lock` is present)
   - Option B: `source("install_packages.R")`
3. Prepare data:
   - Run `scripts/download_nhanes.R` (requires internet). This provides examples using `nhanesA` to pull harmonized variables across cycles.
   - Run `scripts/download_meps.R` (instructions included) or place preprocessed MEPS in `data/meps/`.
   - Run `scripts/download_cdc_wonder.R` to pull cause-specific mortality or drop your pre-aggregated CSV into `data/cdc/`.
4. Fill coefficient CSVs in `config/coefficients/`.
5. Configure simulation parameters in `config/params.yaml` and AOM effect settings in `config/aom_effects.yaml`.
6. Run the pipeline:
   ```r
   targets::tar_make()
   ```
   Outputs are saved under `outputs/`.

## Validation

- See `R/90_validation.R` and the `validate_*` targets in `_targets.R`
- Compares simulated ITT weight change and cardiometabolic changes vs trial sources (Jastreboff 2022; Wilding 2021; etc.)

## PSA and scenarios

- PSA distributions are set in `config/params.yaml` following your eMethods (beta for utilities and health states, gamma for costs, normal for AOM effects, uniform for AEs)
- Scenario analysis: parameter sweeps (e.g., discount rates, discontinuation rates) configured in `config/scenarios.yaml`
- Run PSA with:
  ```r
  source("scripts/run_psa.R")
  ```

## Project structure

- `_targets.R` – pipeline orchestration
- `config/` – parameters, scenarios, coefficients
- `R/` – model modules
- `scripts/` – data acquisition and orchestration helpers
- `data/` – raw/processed datasets (gitignored)
- `outputs/` – simulation results, validation, figures (gitignored)

## Notes

- Risk models, utilities, and cost functions are wired to load coefficients from CSVs so you can audit, update, and cite easily.
- Annualization of multi-year risks uses standard transformations (e.g., `1 - (1 - p_k)^(1/k)` with logit-space handling when required).
- Cause-specific mortality is applied conditionally (CVD death only to those with CVD, etc.) as per eMethods.

## References (abbrev.)
- ACC/AHA Pooled Cohort Equations (Goff et al., 2014)
- Framingham Offspring diabetes risk (Wilson et al., 2007)
- Framingham recurrent CHD (D’Agostino et al., 2000)
- HRQOL model (Lubetkin et al., 2005)
- Trial ITT effects and AEs (Jastreboff 2022; Wilding 2021; Greenway 2010; Gadde 2011; Garvey 2014/2023; Davies 2021)
- Costs: MEPS 2016–2020, CMS event costs, SSR Health and FSS pricing