# Homework Assignment - Financial Statement Analysis

# Scenario: You are a Data Scientist working doe a consulting frim.
# One of your colleagues from the auditing dept. has asked you help them
# access the financial statement of organisation X.

# You have been supplied with 2 vectors of data:  monthly revenue and
# monthly expenses for the financial year in question; your tasxk is
# to calculate the following metrics:
# - Profit for each month
# - Profit after tax for each month (rate 30%)
# - Profit margin for each month (profit after tax / revenue)
# - Good months - profit after tax greater than mean for year
# - Bad months - as above but less than
# - Best month - where profit after tax was best for year
# -- Worst month - profit after tax was min for year

#                   NOTES ON COMPLETION:

# Best month / worst month should be TRUE/FALSE Vectors
# All results need to be presented as vectors
# Results for $ values need to be presented to $0.01 precision but
#    need to be presented in units of $1,000 (ie lk) with no decimal points
# Results for profit margin need to be presented as % with no
#    decimal points
# Tax for any given month can be negative.

# Provided data:

revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

# Calculate Profit for each month:
# ?round()
profit <- round(revenue - expenses, 2) # Same as tutor but did not use round()

# Profit after tax
net_profit <- round(profit - (profit * 0.3), 2) # Tutor split out calculation of
# then did profit - tax

# Margin
margin <- round(net_profit / revenue, 2) * 100 # Same as tutor

# mean Profit - for later calc
mean_profit <- round(mean(net_profit), 2) # Something not right here, Tutor getting 1750.681
# from this calculation although my previous steps all match, my error I didn't rerun
# Net_profit after correcting the spelling of variable name! DUH
# good Months
good_months <- net_profit > mean_profit # Same as Tutor

# Bad Months
bad_months <- net_profit < mean_profit # Tutor did it with !good_months

# Best Month
best_month <- max(net_profit) # Tutor's method:
# best.month <- net_profit == max(net_profit). Ending up with a vector
# Of TRUE and FALSE values, ovrekill as we don't have a dataframe to read the month from
# to my mind.
best.month2 <- net_profit == max(net_profit)


# Worst Month
worst_month <- min(net_profit) # Sure this one will be caclculated in same way.
worst.month2 <- net_profit == min(net_profit)

# Thknk that covers all - just cannot work out how to get the K after dividing by 1000
# amounts to show as xK.

# Units Thousands

revenue.1000 <- round(revenue / 1000) # This does not explain how to get the K after the amount as per the requirement
expenses.1000 <- round(expenses / 1000)
profit.1000 <- round(profit / 1000)
net.profit.1000 <- round(net_profit / 1000)

# And present the final result:

revenue.1000
expenses.1000
profit.1000
net.profit.1000
margin
good_months
bad_months
best.month2
worst.month2

# Bonus - Create a Matrix from the results.  Now obvious why Tutor
# produced TRUE & FALSE vectors for months good and bad

m <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  net.profit.1000,
  margin,
  good_months,
  bad_months,
  best.month2,
  worst.month2
)
m

# How to change column and row headers in next section.