#############################
#Coursera R Programming Course
#
#Subject: Function to calculate mean 
#of pollutant across specified monitors
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
pollutantmean <- function(dir, poll, id = 1:332){
  #Store csvs with specified ids in DF
  #Start with first file
  df <- read.csv(paste(dir,paste(paste('/specdata/',
          sprintf("%03.0f",min(id)),".csv",sep=""),sep=""),sep=""))
  #Iterate throughout the rest
  #Add exception for single id
  if(min(id)!=max(id)){
    for(i in (min(id)+1):max(id)){
      df <- rbind(df, read.csv(paste(dir,paste(paste('/specdata/',
              sprintf("%03.0f",i),".csv",sep=""),sep=""),sep="")))
    }
  }
  #Calculate and return mean of specific pollutant while ignoring NAs
  return(mean(df[,poll], na.rm = TRUE))
}

#Use the function to answer the quiz
pollutantmean(cd,'nitrate')


