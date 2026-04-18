# run_regression.R
# Estimate a Mincer wage equation
# Exercise 2 — Session 1
#
# Uses wooldridge::wage1 (Jeffrey Wooldridge's teaching dataset)

wages <- wooldridge::wage1

# Basic OLS: Mincer wage equation
model1 <- lm(log(wage) ~ educ + exper + tenure, data = wages)
summary(model1)

# Add experience squared
model2 <- lm(log(wage) ~ educ + exper + I(exper^2) + tenure, data = wages)
summary(model2)
