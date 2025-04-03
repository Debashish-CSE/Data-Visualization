library(lubridate)
df <- data.frame(
  dob = c("11/10/1963", "Jan-23-91", "12:1:2001")
)
#str(df)

#convert dob column data from character to date(mdy format) 
df$dob <- mdy(df$dob)
str(df)
