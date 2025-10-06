# Use CDC WONDER API or manual export for 2012–2016 cause-specific mortality by age, sex, race/ethnicity.
# Then compute cause-specific rates and apply only to those with relevant conditions (CVD deaths only if CVD present, etc.).

message("Please download and preprocess CDC WONDER mortality tables to data/cdc/. Update R/50_mortality.R to use those tables.")
