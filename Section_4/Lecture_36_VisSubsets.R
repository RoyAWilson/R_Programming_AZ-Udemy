# Lecture 36 Visualising Subsets

matplot(t(MinutesPlayed), type = 'b', pch = 15:18, col = c(1:4, 6), xlab = 'Season', ylab = 'Minutes Played')
title('Minutes Played')
legend('bottomleft', inset = 0.01, legend = Players, col = c(1:4, 6), pch = 15:18, horiz = FALSE)

# To subset the data to top 3 players

data = MinutesPlayed[1:3,]
data

matplot(t(data), type = 'b', pch = 15:18, col = c(1:4, 6), xlab = 'Season', ylab = 'Minutes Played')
title('Minutes Played')
legend('bottomleft', inset = 0.01, legend = Players[1:3], col = c(1:4, 6), pch = 15:18, horiz = FALSE)

# Think this is porbably easier to write, guess he might cover this way later.
# Would like to find out how to reset the legend to show only the 4 player names.
# Huh! Spent ages looking it up, problems caused by using [7:10,] Comma was not needed,
# Tutor went through changing the legend immediately after, needn't have spent ages playing with it.
 
matplot(t(MinutesPlayed[7:10,]), type = 'b', pch = 15:18, col = c(1:4, 6), xlab = 'Season', ylab = 'Minutes Played')
title('Minutes Played')
legend('bottomleft', inset = 0.01, legend = Players[7:10], col = c(1:4, 6), pch = 15:18, horiz = FALSE)

# To Visualise only KobeBryant:

matplot(t(data[1,,drop=FALSE]), type = 'b', pch = 15:18, col = c(1:4, 6), xlab = 'Season', ylab = 'Kobe Bryant Minutes Played')
title('Minutes Played')
legend('bottomleft', inset = 0.01, legend = Players[1], col = c(1:4, 6), pch = 15:18, horiz = FALSE)
#NB NEED TO ADD DROP=FALSE TO DATA INDEX AS OTHERWISE PRODUCES A VECTOR AND GRAPH LOOKS WEIRD 