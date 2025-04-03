a <- 5
b <- 6
a+b
sum(a,b)

name <-c("Greg", "Gill")
name

name <- c("Greg", "paul", "kai")
age <- c(47, 52, 34)
gender <- c("M", "M", "F")

friends <- data.frame(name, age, gender)
#show the data frame
friends

#show a specific column
friends$name

#friends[row,column]
friends[1, ] #shows 1st row
friends[1,1] #shows 1st element
friends[1:3,1] #1st column's 3 observations
friends[1,1:3] #1st row's 3 observations

#filter age <50, and 1st 2 columns
friends[friends$age<50,1:2] 

library(tidyverse)

friends %>%
  select(name, age) %>%
  filter(age<50) %>%
  arrange(age)
