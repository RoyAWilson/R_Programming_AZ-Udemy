# Lecture 14 The If Statement, Else Statement and ElseIf

# Produce random numbers from a normally distributed set

# To produce a number with mena near zero.  Other arguments exist
# and the mean can be changed.  These will be covered
# in upcoming lectures
# The number generated is likely to fall in the range -3 to 3

rm(answer)
# rm will remove the variable so that we will not run into the problem
# of answer holding a vaule assigned on a previous run but will start
# with a fresh variable each time
x <- rnorm(1)

if( x > 1 ){
  
  answer <- 'Greater than 1'
  
}else{
  if(x >= -1){
    answer <- 'is between -1 and 1'
  }else{
    answer <- 'Is Less than -1'
  }
}

# Using Else If:

rm(answer1)

x <- rnorm(1)

if( x > 1 ){
  
  answer1 <- 'Greater than 1'
  
}else if(x >= -1){
    answer1 <- 'is between -1 and 1'
  }else{
    answer1 <- 'Is Less than -1'
}
