#visualize

plot(pressure)

#data, mapping, geometry
library(tidyverse)

#Bar plots
ggplot(data = starwars,
       mapping = aes(x = gender))+
  geom_bar()

#Histograms
starwars %>%
  drop_na(height) %>%
  ggplot(aes(height),binwidth=30, bordder)+
  geom_histogram()

#Boxplots
starwars %>%
  drop_na(height) %>%
  ggplot(aes(height))+
  geom_boxplot(fill = "steelblue")+
  theme_bw()+
  labs(title = "Boxplot of height",
       x = "Height of characters")

#Density plots
starwars %>%
  drop_na(height) %>%
  filter(sex %in% c("male", "female")) %>%
  ggplot(aes(x = height,
             color = sex,
             fill = sex))+
  geom_density(alpha = 0.8)+ #alpha=opacity of color
  theme_bw()

#Scatter plots
starwars %>%
  filter(mass < 200) %>%
  ggplot(aes(x = height,y = mass,
             color = sex))+
  geom_point(size = 3, alpha = 0.8)+
  theme_minimal()+
  labs(title = "Height and mass scatter plot")


#smoothed model
starwars %>%
  filter(mass < 200) %>%
  ggplot(aes(x = height,y = mass,
             color = sex))+
  geom_point(size = 3, alpha = 0.8)+
  geom_smooth()+
  facet_wrap(~sex)+
  theme_bw()+
  labs(title = "Height and mass scatter plot with linear model")

#geom_jitter, size, color as variable
library(tidyverse)
view(gapminder)

gapminder %>%
  filter(continent %in% c("Africa", "Europe")) %>%
  filter(gdpPercap < 30000) %>%
  ggplot(aes(x = gdpPercap,
             y = lifeExp,
             size = pop,
             color = year))+
  geom_jitter(alpha = 0.8)+
  facet_wrap(~continent)+
  theme_bw()+
  labs(title = "Life expectancy explained by GDP per capita",
       x = "GDP per capita",
       y = "Life expectancy")

library(RColorBrewer)
display.brewer.all(colorblindFriendly=TRUE)

#save plots
p <- mpg %>%
  ggplot(aes(x = cty, fill = drv))+
  geom_density(alpha = 0.3)+
  theme_bw()
ggsave("mpg plot.png",
       width = 10,
       height = 7,
       units = "cm",
       dpi = 300)
