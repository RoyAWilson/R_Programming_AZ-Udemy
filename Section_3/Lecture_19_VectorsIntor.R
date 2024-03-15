# Lecture 19 Let's Create some Vectors:
# c is a function, see also notes from last course that disappeared
# before I finished it.

MyFirstVector <- c(3, 45, 56, 732)
MyFirstVector
is.numeric(MyFirstVector)
is.integer(MyFirstVector)
is.double(MyFirstVector)
# All stored as doubles.

# Create a vector of integers:

V2 <- c(5L, 12L, 243L, 0L)
is.numeric(V2)
is.integer((V2))
is.double(V2)

# Create a character Vecto:

V3 <- c('a', '823', 'Hello')
is.character(V3)
V3

# Confirm that a vector can only hold elements of the same type:

V4 <- c('a', '823', 'Hello', 7)
is.numeric(V4)
is.character(V4)
V4


# Other ways to produce Vectors:
# 1) Sequence - seq()
# 2) Replicate - rep()

V5 = seq(1,15)  # NB I used a colon and that worked but tutor uses comma,
#probably a good reason so will follow his lead.
# Must still be thinking python and pandas.
# Apparently Tutor had same problem starting R and advises that the
# comma version is the correct way to do this.
# Using the comma allows one to pass a step argument
V5

V6 = seq(2, 20, 2)
V6
# Do not make the error of using step() keyword gives an error

# Replicate:

V7 <- rep(3, 50)
V7

# Replicate with Character Type:

V8 <- rep('a', 12)
V8

# Replicate with vectors:

x <- c(80, 20)
V9 <- rep(x, 6)
V9
