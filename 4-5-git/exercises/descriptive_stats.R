# descriptive_stats.R
# Summary statistics and distributions
# Exercise 4 — Session 2 (branch exercise)

library(readr)

# Load data
wages <- read_csv("data/wages.csv")

# Summary statistics
summary(wages[, c("wage", "educ", "exper", "tenure")])

# Wage distribution
hist(wages$wage, main = "Distribution of Wages", xlab = "Hourly wage ($)")
hist(log(wages$wage), main = "Distribution of Log Wages", xlab = "Log hourly wage")

# Education by gender
tapply(wages$educ, wages$female, mean, na.rm = TRUE)
