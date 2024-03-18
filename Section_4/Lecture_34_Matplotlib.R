# Lecture 33 Matrix Operations:
# Uses the NBA dataset

Games
colnames(Games)
rownames(Games)

# Games played by LeBronJames in 2012:

Games['LeBronJames', '2012']

sum(Games['LeBronJames', 1:10])
# Works like Python but only with x:x not 'X':'X'

FieldGoals

# To get division of FieldGoals by Games to give average goals per year per game:

round(FieldGoals / Games, 2)

# To find average number of minutes played per game per year from the tables:

round(MinutesPlayed / Games, 2)


# Lecture 34 - Visualising with Matploltib

# From overview looks a lot like matplotlib in python

# 1) plot a simple matrix using field goals:
#   Will need to transpose the table to use for this example:
#   to transpose use t()

FieldGoals
matplot(t(FieldGoals), type = 'b', pch = 15:18, col = c(1:4, 6), xlab = 'Season', ylab = 'Goals Scored')
title('Field Goals Scored')
legend('bottomleft', inset = 0.01, legend = Players, col = c(1:4, 6), pch = 15:18, horiz = FALSE)

# And now divide the field goals by number of games to give a more accurate picture of goals scored by player

matplot(t(FieldGoals / Games), type = 'b', pch = 15:18, col = c(1:4, 6), xlab = 'Season', ylab = 'Goals Scored')
title('Field Goals Scored In Played Games')
legend('bottomleft', inset = 0.01, legend = Players, col = c(1:4, 6), pch = 15:18, horiz = FALSE)
