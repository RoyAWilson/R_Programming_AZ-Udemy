# Lecture 23 Fucntions in R

# Spends some time covering functions that we have already used:

# c, rnorm(), print(), seq(), rep(), isInteger(), isNumeric(),
# isInteger(), isDouble(), isCharacter(), typeof(), sqrt(), paste()

# This lecture look more closely at the functions and the params they
# are expecting to be passed.

# Firstly the ? for help
# EG:

?rnorm()
# Brings up help on the function in the lower right pane of window.
# The help window for the above is very complete and comes with a
# code snippet to show how to use the function

# Try passing arguments to rnorm()

rnorm(5, )
# produces vector of 5 values; other values set to defaults
# val of mean = 0, val of std = 1 by default
# only required value N

# Passing the other parameters:

rnorm(5, 10, 8)
# Just to see if keyword args also work:
rnorm(n=5, mean=10, sd=8)
# Yep they work with keyword args sequence is un-important
# With keyword params if any missing the defaults will be filled in

?c
# Takes 2 arguments apart from the vector generator:
# recusive, use.names both boolean values
# No explanation given in tutorial

?seq()
seq(from=2, to=20, by=3)
# Also has argument length.out allows to specify how long you
# want your vector to be.

seq(from=2, to=20, length.out=100)
# Produces a vector of 100 doubles equally spaced in range 2 to 20
# Also available along with - feed in a vector to determine step
x <- c('a', 'b', 'c')
seq(from = 2, to = 20, along.with = x)
# This has fed 3 values for the step so 3 equally spaced values
# between 2 and 20 returned.

y <- c(1, 2, 3)
seq(from = 2, to = 20, along.with = y)
# Works with numeric values too, thought it might give an error
# or some kind of weird result.

?rep()
# Also has length.out for same as seq()
rep(5:6, times = 10)
rep(5:6, each = 10)
# produces a vector with 10 elements 5 and 10 elements 6
rep(x, times = 5)
rep(x, each = 5)

# Using sqrt() with a vector:

A = seq(from=10, to=20, along.with=x)
A
sqrt(A)
B <- sqrt(A)
B
