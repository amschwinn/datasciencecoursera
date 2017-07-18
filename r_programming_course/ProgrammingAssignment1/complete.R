#############################
#Coursera R Programming Course
#
#Subject: Function to read directory
#of CSVs and returns df of complete
#observations for each specified file
#in a directory
#
#Author: Austin Schwinn
#
#July 18, 2017
#############################

#install.packages('rstudioapi')
library(rstudioapi)

#Set cd
cd <- dirname(rstudioapi::getActiveDocumentContext()$path)

#Write function with inputs of directory, pollutant, and csv ids
complete <- function(dir, id = 1:332){
  #df to store info
  df            <- data.frame(rep(NA,2),ncol=2)
  colnames(df)  <- c("id", "nobs")
  ind           <- 1
  #Iterate throughout specified files
  for(i in id){
    #calc number of complete obs
    comp_obv      <- na.omit(read.csv(paste(dir,paste(
                        paste('/specdata/', sprintf("%03.0f",
                        i),".csv",sep=""),sep=""),sep="")))
    #store id
    df[ind,'id']  <- sprintf("%03.0f",i)
    #store num of complete observations
    df[ind,'nobs'] <- nrow(comp_obv)
    ind <- ind+1

  }
  #Return df of calculations
  return(df)
}


#Use the function to answer the quiz
cc <- complete(cd,54)
print(cc$nobs)

