#load the data
url <- "https://tinyurl.com/mtktm8e5"
insurance <- read.csv(url)

#create an obesity variable
insurance$obese <- ifelse(insurance$bmi >= 30,
                          "obese", "not obese")
library(tidyverse)
install.packages(ggplot)
ggplot(insurance, age, expenses)+
  geom_point()

