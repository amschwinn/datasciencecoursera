setwd("C:/Users/ASUS/Documents/Coursera/rProgramming/ProgrammingAssignment3")

#Plot the 30-day mortality rates for heart attack
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

outcome[,11] <-  as.numeric(outcome[,11])
hist(outcome[,11])


best <- function(state,outcome){
  ## Read outcome data
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ##Check that state and outcome are valid
  states <- unique(outcome$State)
  state_true <- FALSE
  for(i in 1:length(states)) {
    if(states[i] == state){
      state_true <- TRUE
    }
  }
  if(state_true==FALSE){
    stop("Not a state")
  }
  3+3
}

best("QZ","pneumonia")
states <- unique(outcome$State)
