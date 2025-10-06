# Example workflow to assemble NHANES 1999–2016 baseline.
# You can adopt nhanesA package to pull variable tables and harmonize across cycles.
# Save harmonized baseline with weights to data/nhanes/baseline_population.rds

if (!requireNamespace("nhanesA", quietly = TRUE)) install.packages("nhanesA")
library(nhanesA); library(dplyr); library(readr); library(purrr); library(tidyr)

# Define cycles to download
cycles <- c("1999-2000", "2001-2002", "2003-2004", "2005-2006", 
            "2007-2008", "2009-2010", "2011-2012", "2013-2014", "2015-2016")

# Define required tables (demographics, examination, laboratory, questionnaire)
# Example: DEMO, BMX, BPX, TCHOL, HDL, GLU, DIQ, etc.

message("Download NHANES data from 1999-2016 and harmonize variables.")
message("Save to data/nhanes/baseline_population.rds")
