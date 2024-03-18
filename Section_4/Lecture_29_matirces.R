# Lecture 28 Basket Ball Project.

# Examine the data from the previous filfe

# As the file has been read into memeoty already can use it
# So can look att he salary matrix:

Salary
Games
MinutesPlayed

# Lecture 30 building out first matrix
# create a matirx using matrix() function:
# Arguments: data, nrow, ncol, byrow, dimensions
# Produce a vector of data

my_data <- 1:20
my_data

# and produce a matrix from it
A <- matrix(data = my_data, nrow = 4, ncol = 5)
A
A1 <- matrix(data = my_data, nrow = 4, ncol = 5, byrow = TRUE)
A1
A1[1,3]
A1[1:3, 2:4]
# Nice indexing works same as with Numpy and python.

# Excercise get the number 10
A[2,3]

# Excercise try to get to 10 in matrix A1.
A1
A1[2,5]

# Producing a matrix using rbind() function:

r1 <- c('I', 'am', 'haopy!')
r2 <- c('What', 'a', 'day')
r3 <- c(1, 2, 3)

C <- rbind(r1, r2, r3)
C

# And produce same matrix using cbind() function

c1 <- cbind(r1, r2, r3)
c1

c.1 <- 1:5
c.2 <- -1:-5
D <- cbind(c.1, c.2)
D
