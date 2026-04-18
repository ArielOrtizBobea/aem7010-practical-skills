# descriptive_stats.R
# Summary statistics and distributions
# Exercise 4 — Session 2 (branch exercise)
#
# Uses wooldridge::wage1

wages <- wooldridge::wage1

# Summary statistics
summary(wages[, c("wage", "educ", "exper", "tenure")])

# Wage distribution
hist(wages$wage, main = "Distribution of Wages", xlab = "Hourly wage ($)")
hist(log(wages$wage), main = "Distribution of Log Wages", xlab = "Log hourly wage")

# Mean education by gender
tapply(wages$educ, wages$female, mean, na.rm = TRUE)
