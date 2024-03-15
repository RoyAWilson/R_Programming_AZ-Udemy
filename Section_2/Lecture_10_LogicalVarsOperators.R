# Lecture 9 Logical Variables And Operators:

# TRUE All caps or T
# FALSE All Caps of F

4 < 5
10 > 100
4 == 5

# The 10 Logical Operators Are:

#  1) ==
#  2) !=
#  3) <
#  4) >
#  5) <=
#  6 >=
#  7) !
#  8) |  Be aware || Has a completely different meaning in R
#  9) &
# 10) isTRUE(x)

result <- 4 < 5
result

typeof(result)

# Using NOT (!) operator:

result2 <- ! TRUE
result2


result2a <- !(5>1)
result2a

# Or (|) and And (&)

result | result2

result & result2

# isTRUE

isTRUE(result)
