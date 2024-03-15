# Lecture 22 The power of Vectorised Operations
# NB Lecture 21 was an intro to Vectorised Operations

# Return the elements of a vector individually with a loop:

x <- rnorm(5)

for(i in x){
  print(i)
}

# Print elements using a vector:

j <- 1:5
print(x[j])

# Tutor uses a loop:

for(k in 1:5){
  print(x[k])
}

# Better approach as puts each element on own line.

# The above loop is being taught to highlight the difference
# between vectorised and non-vectorised functions

N <- 100
a <- rnorm(N)
b <- rnorm(N)

# Compare vectorised against non-vectorised operation

# 1) Vectorised approach:

c <- a * b

# 2) Non-Vectorised approach:

d <- 0 # Empty Vector for storing result
for(l in 1:100){
  d[l] <- a[l] * b[l]
}

# Tutor did it slightly differently apparently rep(NA, N
# sets aside memory for the calculation. Hope he explains this more:

e <- rep(NA, N)
for(m in 1:N){
  e[m] <- a[m] * b[m]
}

# As with vectorised calculations in Python and Pandas
# They run faster

# R is a high level language and will be calling languages such
# as C or Fortran to work the calculations for it.
