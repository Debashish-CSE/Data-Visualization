ages <- c(5, 6)
names <- c("john", "james")

friends1 <- data.frame(names, ages)
View(friends1)
str(friends)


#built in data sets---------------------------
data()
view(starwars)
?starwars #know about the data set


library(tidyverse)

#tidy the data--------------------------------
starwars |>
  filter(height > 150 & mass < 200) %>%
  mutate(height_in_meters = height/100) %>%   #create new variable to change height from cm to meters
  select(height_in_meters, mass) %>% 
  arrange(mass) %>%   #arrange mass from smallest to largest
  #view()             #view the selected data
  plot()              #plot the selected data



#explore data set-----------------------------
view(msleep)
glimpse(msleep) #overview of data
head(msleep)

class(msleep$name) #which data type is the variable

length(msleep) #number of variables

length(msleep$name) #number of observations in name

names(msleep) #names of the variable

unique(msleep$vore) #names of the categories in that variable column

missing <- !complete.cases(msleep) #missing data
msleep[missing, ] #rows that have missing data


#cleaning data--------------------------------
#select variable

view(starwars)
starwars %>%
  select(name, height, mass)
starwars %>%
  select(1:3)

starwars %>%
  select(ends_with("color")) #variable name that ends with color
                             #starts_with(), contains() is also applicable

#change variable order
starwars %>%
  select(name, mass, height, everything()) %>%
  view()
         
#change variable name
starwars %>%
  rename("characters" = "name") %>%
  head() #shows 1st 6 rows

#change variable type
class(starwars$hair_color)

starwars$hair_color <- as.factor(starwars$hair_color)

class(starwars$hair_color)

#using tideverse
starwars %>%
  mutate(hair_color = as.character(hair_color)) %>%
  glimpse()

df <- starwars
df$sex <- as.factor(df$sex)

levels(df$sex) #alphabetical order
df <- df %>%
  mutate(sex = factor(sex,
                      levels = c("male", "female", "hermaphroditic", "none")))
levels(df$sex) #after specifying the order


#filter rows
starwars %>%
  select(mass,sex) %>%
  filter(mass <65 & sex == "male")

#recode data
starwars %>%
  select(sex) %>%
  mutate(sex = recode(sex,
                      "male" = "man",
                      "female" = "woman"))

#Dealing with missing data
mean(starwars$height, na.rm = TRUE) #na.rm => missing data remove

starwars %>%
  select(name, gender, hair_color, height)
starwars %>%
  drop_na(hair_color)

#Dealing with duplicates
Names <- c("peter", "john", "andrew", "peter")
Age <- c(22,33,44,22)

friends <- data.frame(Names, Age)
friends
friends %>%
  distinct() #removes the duplicates


#Manipulate
starwars %>%
  mutate(height_m = height/100) %>%
  select(name, height, height_m)

#Conditional change
starwars %>%
  mutate(height_m = height/100) %>%
  select(name, height, height_m) %>%
  mutate(tallness =
           if_else(height_m < 1,
                   "short",
                   "tall"))

#reshape wide data
install.packages(gapminder)
library(gapminder)
data <- select(gapminder, country, year, lifeExp)
view(data)

wide_data <- data %>%
  pivot_wider(names_from = "year", values_from = "lifeExp")
view(wide_data)

#reshape longer data


#range / spread
min(msleep$awake)
max(msleep$awake)
range(msleep$awake)
IQR(msleep$awake)
head(msleep)

#centrality
mean(msleep$awake)
median(msleep$awake)
variance(msleep$awake)
summary(msleep$awake)

msleep %>%
  select(awake, sleep_total) %>%
  summary()


#summarize my data
msleep %>%
  drop_na(vore) %>%
  group_by(vore) %>%
  summarise(Lower = min(sleep_total),
            Average = mean(sleep_total),
            Upper = max(sleep_total),
            Difference = 
              max(sleep_total)- min(sleep_total)) %>%
  arrange(Average) %>%
  View()

#create a table
table(msleep$vore)

msleep %>%
  select(vore,order) %>%
  filter(order %in% c("Rodentia", "Primates")) %>%
  table()

