library(readxl)
library(dplyr)
library(tidyverse)


Mydata <- read_excel("D:/Programming/R_data_visualization/RProgrammingPractice/ColumnBarData.xlsx", sheet=1)

cats <-Mydata$Years
values <- Mydata$Sales

#plot(cats, values, type="l", col = "red", lwd=2)

ggplot(Mydata, aes(cats, values))+
  geom_line()+
  geom_point(size = 3)+
  #theme_bw()+
  labs(x = "Years",
       y = "Sales",
       title = "Line chart showing Sales across different years")

#data <- read.csv("D:/Programming/R_data_visualization/RProgrammingPractice/try.csv")



####pie chart using ggplot2

# Install necessary packages if you haven't already
install.packages("ggplot2")

