library(readxl)
library(dplyr)
library(RColorBrewer)

Mydata <- read_excel("D:/Programming/R_data_visualization/RProgrammingPractice/PieData.xlsx", sheet=1)

cats <-Mydata$Category
values <- Mydata$UserNumber

percentages <- round(values / sum(values) * 100, 1) 

pie(values, labels = paste(cats,"-",percentages,"%"),
    main = "Pie Chart", col= brewer.pal(5, "Set1"))
 
#col=rainbow(length(Mydata$UserNumber
# Custom pastel color palette
colors <- c("#ffb3e6", "#ff6666", "#c2c2f0", "#66b3ff", "#66b3d6")
pie(values, labels = paste(cats,"-",percentages,"%"),
    main = "Pie Chart", col= colors)



#pie chart using ggplot2


# Load the ggplot2 package
library(ggplot2)

# Data for the pie chart
data <- data.frame(
  category = c("Category A", "Category B", "Category C", "Category D"),
  value = c(25, 35, 20, 20)
)

# Calculate the percentage for each category
data$fraction = data$value / sum(data$value)
data$ymax = cumsum(data$fraction)  # cumulative sum of fractions
data$ymin = c(0, head(data$ymax, n=-1))  # starting point for each slice

# Create the pie chart using ggplot2
ggplot(data, aes(ymax = ymax, ymin = ymin, xmax = 4, xmin = 3, fill = category)) +
  geom_rect() +
  coord_polar(theta = "y") +  # This transforms the plot into a pie chart
  theme_void() +  # Clean up the background
  theme(legend.title = element_blank()) +  # Remove legend title
  labs(title = "Beautiful Pie Chart") +  # Add a title
  scale_fill_brewer(palette = "Set3")  # Color palette from RColorBrewer

