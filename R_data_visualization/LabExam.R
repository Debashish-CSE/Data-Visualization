library(readxl)
library(dplyr)
library(RColorBrewer)
library(tidyverse)

Mydata <- read_excel("D:/Programming/R_data_visualization/BubbleData.xlsx", sheet=1)
view(Mydata)
#Bubble plots
Sizes <-  Mydata$`Market Share (%)`
Mydata %>%
  ggplot(aes(x = Mydata$`Marketing Spend ($)`,y = Mydata$`Revenue($)`,
             size = sizes, colour = sizes))+
  geom_point( alpha = 1)+
  theme_minimal()+
  labs(title = "Relationship between Marketing Spend, Revenue
and Product Categories",
       x = "Marketing Spend",
       y = "Revenue")
