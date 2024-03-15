# Lecture 20 Using the square brackes []

w <- c('a', 'b', 'c', 'd', 'e')

# Me playing before lecture starts seems it is something like
# indexing in python though the -1 seems to act differently
# and indexing starts at 1 NOT 0

w[2]
w[2:4]
w[-1:0]
w[5:3]

# From tutorial:

w[-3]

# Misses the thrd element but outputs all other items

# Also:

v <- w[-3]
v

w[c(1, 3, 5)]
# Returns the 1at, 2nd and 3rd elements of the vector

w[c(-2, -4)]

w[-3: -5]
w[0:2]
# Weird using a zero

w[9:5]
# Very odd that no error message