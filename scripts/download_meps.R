# Instructions:
# - Download MEPS 2016–2020 Full-Year Consolidated Data Files (HC-192 through HC-224) from AHRQ
# - Prepare survey design with weights, strata, PSU
# - Fit 2-stage expenditure model:
#   Stage 1: logit(any_expense)
#   Stage 2: GLM(gamma, log link) on positive expenses
# - Save model coefficients to data/meps/expenditure_model.rds

message("Download MEPS 2016-2020 data and fit 2-stage expenditure model.")
message("Save coefficients to data/meps/expenditure_model.rds")
