# Lecture 24 - Packages in R

# Packages description is basically pretty much the same as packages
# in Python

# A more in depth look at ggplot:

# Goes through how to install the package install.packages('ggplot2')

# try to see if qplot is included
?qplot()
# Seems to be installed for me, though not for the tutor.

?ggplot()
?diamonds

# To activate from here type library(ggplot2) - mine was already
# activated, probably why I got different results to the tutor.
# Probably a good idea to do it from here in production code.

# Example of the package:

qplot(data=diamonds, carat, price, colour = clarity, facets = .~clarity)

# getting deprication warning about qplot.  Turns out nice plot though
# Tutor doesn't go into detailed explanation of the above snippet.
