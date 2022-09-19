#plot 

library(tidyverse)
library(readr)
gb3 <- read_csv("data/greenbook_tidy.cvs")


ggplot(gb4, aes(x = log_dollars_aid, fill= assistance_category)) +
  geom_histogram(alpha = 0.5)

#The amount of total aid the US spend from 1948 to 2020 in natural log 
# divided between economic and military aid. 

ggsave("econ-and-milt-aid.png", height = 5, width = 8)
