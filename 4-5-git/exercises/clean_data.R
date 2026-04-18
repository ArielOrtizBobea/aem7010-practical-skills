# clean_data.R
# Load and clean the wage dataset
# Exercise 1 & 2 — Session 1

library(readr)

# Load data
wages <- read_csv("data/wages.csv")

# Remove observations with missing wages
wages <- wages[!is.na(wages$wage), ]

# Log transformation
wages$log_wage <- log(wages$wage)

# Keep only full-time workers
wages <- wages[wages$hours >= 35, ]
