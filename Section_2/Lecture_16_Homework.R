# To prove the law of large numbers with a simple iteration

N <- 1000000
counter <- 0 #Reset Counter to zero before start

for(i in rnorm(N)){
  
  if(i < 1 & i > -1){
    counter = counter + 1
  }
  
}

answer <- counter / N

# NB i is not an index number it will have the value od rnorm(N)
# ib each iteration of the loop it does not act as a loope counter!
