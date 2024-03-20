# Lecture 37 Creating your first Function:

# Turn graphing from previous lecture into to function:

my_plot <- function(){
  matplot(t(data[1,,drop=FALSE]), type = 'b', pch = 15:18, col = c(1:4, 6), xlab = 'Season', ylab = 'Kobe Bryant Minutes Played')
  title('Minutes Played')
  legend('bottomleft', inset = 0.01, legend = Players[1], col = c(1:4, 6), pch = 15:18, horiz = FALSE)
}
# To Call function:

my_plot(1:5)

my_plot_2 <- function(rows){
  matplot(t(data[rows,,drop=FALSE]), type = 'b', pch = 15:18, col = c(1:4, 6), xlab = 'Season', ylab = 'Kobe Bryant Minutes Played')
  title('Minutes Played')
  legend('bottomleft', inset = 0.01, legend = Players[rows], col = c(1:4, 6), pch = 15:18, horiz = FALSE)
}

my_plot_2(1:3)

data

# To Add flexibility to the function need to pass parameters.  In brackets add params required

# Add Further Paramaters:

my_plot_3 <- function(data, rows){
  Data <- data[rows,, drop=FALSE]
  matplot(t(Data[rows,,drop=FALSE]), type = 'b', pch = 15:18, col = c(1:4, 6), xlab = 'Season', ylab = 'Kobe Bryant Minutes Played')
  title('Minutes Played')
  legend('bottomleft', inset = 0.01, legend = Players[rows], col = c(1:4, 6), pch = 15:18, horiz = FALSE)
}
my_plot_3(Salary, 1:10)

# Adding Default Values for Paramaters to Function

my_plot_4 <- function(data, rows=1:10){
  Data <- data[rows,, drop=FALSE]
  matplot(t(Data[rows,,drop=FALSE]), type = 'b', pch = 15:18, col = c(1:4, 6))
  # title('Minutes Played')
  legend('bottomleft', inset = 0.01, legend = Players[rows], col = c(1:4, 6), pch = 15:18, horiz = FALSE)
}
my_plot_4(MinutesPlayed/Games, 1:3)
