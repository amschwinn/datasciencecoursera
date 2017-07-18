#############################
#Coursera R Programming Course
#
#Subject: Function to read directory
#of CSVs and returns correlation for
#monitor locations where number of 
#complete observations is greater
#than a specified threshold.
#If no monitors meet the threshold,
#return a numeric vector of length 0
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
corr <- function(dir, thresh=0){
  #Number of files to iterate through
  fl <- length(list.files(paste(dir,
          '/specdata',sep=""),pattern = "*.csv", full.names = FALSE))
  #Initialize empty vector for correlations
  corTresh <- vector(mode="double",length=0)
  #Iterate through all csv
  for(i in 1:fl){
    #read csv
    df <- read.csv(paste(dir,paste(paste('/specdata/', 
            sprintf("%03.0f",i),".csv",sep=""),sep=""),sep=""))
    #Keep only complete observations
    df <- na.omit(df)
    #Only use csvs with complete observations >= threshold
    if(thresh<nrow(df)){
      #calculate correlation and add to vector
      corTresh[(length(corTresh)+1)] <- cor(df$sulfate,df$nitrate)
    }
    
  }
  #Return df of calculations
  return(corTresh)
}

#Use the function to answer the quiz
cr <- corr(cd,2000)

