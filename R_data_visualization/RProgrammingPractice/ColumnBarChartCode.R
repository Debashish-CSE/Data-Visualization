library(readxl)
library(dplyr)

Mydata <- read_excel("D:/Programming/R_data_visualization/RProgrammingPractice/ColumnBarData.xlsx", sheet=1)

cats <-Mydata$Years
values <- Mydata$Sales

barplot(values,names.arg=cats,xlab="Sales",ylab="Year",col="orange",main="Sales Trend",border="red",horiz = TRUE)

