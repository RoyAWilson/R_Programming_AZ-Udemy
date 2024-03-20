# Lecture 35 Subsetting:

# Produce a vector to work with

x = c('a', 'b', 'c', 'd', 'e')
x
# To extract first and last values:

x[c(1,5)]
x[1]

# The above code is subsetting x

# Now doing the same with a matrix:

Games

# To look at the first three members of the matrix for the first only for the past 5 years:

Games[1:3, 6:10]

# To Compare top paid player to lowest paid player in the list:

Games[c(1,10),]
# Note a single colon after the , above does not work - gives an error.

# To Subset 2008 and 2009 for all players:

Games[,4:5]

# Up till now have returned matrices but does not always return a matrix.  Choosing only 1 row will return a vector:

Games[1,]

Games[1, 5]
# This is also a vector

# Geting a vector is just the way the language was designed.  R assumes that a vector is required if return is 1 dim
# Therefore returns a vector

# In order to give consistency to results there is another parameter that you can pass after the xolumns:
# The argument is drop and drops unnecessary dimensions:

Games[1,, drop = F]
# Now returns a matrix with row header.
Games[1, 5, drop = F]