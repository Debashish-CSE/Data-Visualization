
# convert wide dataset to long dataset
library(tidyr)

long_data <- pivot_longer(wide_data,
                          cols = c("height", "weight"),
                          names_to = "variable",
                          values_to ="value")
