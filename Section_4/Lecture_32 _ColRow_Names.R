# Lecture 32 Colnames() and Rownames():

# Starting with Named Vectors:

Charlie <- 1:5
Charlie

# Give names to the vector elements:
# Check if elelments have names
names(Charlie)
#Add names to Charlie:

names(Charlie) <- c('a', 'b', 'c', 'd', 'e')
names(Charlie)
Charlie
# Colon notation does not appear to work for indexing with the names, only the numbers.

# To clear names from a vector:

names(Charlie) <- NULL
names(Charlie)
Charlie

# Naming Matrix Dimensions:

temp.vec <- rep(c('a', 'B', 'zZ'), each = 3)
temp.vec

Bravo <-matrix(temp.vec, 3, 3)
Bravo

# Now add rownames

rownames(Bravo)
rownames(Bravo) <- c('How', 'Are', 'You')
rownames(Bravo)
Bravo

# And with columns:

colnames(Bravo)
colnames(Bravo) <- c('X', 'Y', 'Z')
colnames(Bravo)
Bravo

# To put a zero in in the middle:

Bravo['Are', 'Y'] <- 0
Bravo

# To get rid of row/colnames as above with vectors.