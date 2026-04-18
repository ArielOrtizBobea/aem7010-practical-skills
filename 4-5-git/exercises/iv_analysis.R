# iv_analysis.R
# IV regression using 2SLS
# Exercise 4 — Session 2 (branch exercise)

library(readr)
library(AER)

# Load data
wages <- read_csv("data/wages.csv")

# OLS (for comparison)
ols <- lm(log(wage) ~ educ + exper + tenure, data = wages)

# 2SLS: instrument education with parental education
iv <- ivreg(log(wage) ~ educ + exper + tenure |
              mother_educ + father_educ + exper + tenure,
            data = wages)

# Compare estimates
summary(ols)
summary(iv)
