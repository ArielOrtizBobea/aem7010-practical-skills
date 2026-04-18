# iv_analysis.R
# IV regression using 2SLS
# Exercise 4 — Session 2 (branch exercise)
#
# Uses wooldridge::wage2, which includes parents' education as instruments.
# If needed: install.packages(c("wooldridge", "AER"))

library(AER)

wages <- wooldridge::wage2

# OLS (for comparison)
ols <- lm(log(wage) ~ educ + exper + tenure, data = wages)

# 2SLS: instrument education with parents' education
iv <- ivreg(log(wage) ~ educ + exper + tenure |
              meduc + feduc + exper + tenure,
            data = wages)

# Compare estimates
summary(ols)
summary(iv)
