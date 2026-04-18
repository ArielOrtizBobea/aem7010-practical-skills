# run_regression.R
# Estimate wage equation
# Exercise 2 — Session 1

library(readr)

# Load cleaned data
wages <- read_csv("data/wages.csv")

# Basic OLS: Mincer wage equation
model1 <- lm(log(wage) ~ educ + exper + tenure, data = wages)
summary(model1)

# Add experience squared
model2 <- lm(log(wage) ~ educ + exper + I(exper^2) + tenure, data = wages)
summary(model2)
