x <- 4

class(x)


x <- c(4, "a", TRUE)
class(x)


x<-c(1,3,5)
y<-c(3,2,10)
cbind(x,y)

x <- list(2, "a", "b", TRUE)
x[[1]]


x<-1:4
y<-2:3
class(x+y)


hw1 <- read.csv("C:/Users/ASUS/Documents/Coursera/hw1_data.csv")


hw1[(nrow(hw1)-1):nrow(hw1),]

rnum(hw1)

nrow(hw1)

hw1[47,]

count.na(hw1)

sum(is.na(hw1$Ozone))

sub <- subset(hw1, !is.na(Ozone))$Ozone

mean(sub)

sub2 <- subset(hw1, Ozone>31 & Temp>90)$Solar.R
mean(sub2)


sub3 <- subset(hw1, Month == 6)$Temp
mean(sub3)

sub4 <- subset(hw1, Month == 5 & !is.na(Ozone))$Ozone
max(sub4)
