# clean_data.R
# Load and clean the wage dataset
# Exercise 1 & 2 — Session 1
#
# Uses wooldridge::wage1 (Jeffrey Wooldridge's teaching dataset; 526 obs)
# If this is your first time, install the package:
#   install.packages("wooldridge")

# Load data
wages <- wooldridge::wage1

# Remove observations with missing wages
wages <- wages[!is.na(wages$wage), ]

# Log transformation
wages$log_wage <- log(wages$wage)

# Keep only workers with at least a high school education
wages <- wages[wages$educ >= 12, ]
