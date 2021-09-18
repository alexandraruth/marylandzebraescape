######## The Great Maryland Zebra Escape

# load packages
library(tidyverse)


# Create dataframe

date <- seq(as.Date('2021-08-28'), as.Date('2021-09-21'), by = 'days')

zebras <- data.frame(date) %>%
  mutate(count = NA) %>%
  mutate(count = ifelse(date < '2021-08-31', 0, count)) %>% # source: 
  mutate(count = ifelse(date >= '2021-08-31' & date < '2021-09-07', 1, count)) # source: 



# First zebra sighted and reported August 31


# Reported zebra count


# Mixed reporting on zebra counts; six count reported in several outlets

# Create count plot of zebras

ggplot()

# insert zebra emojis


# insert additional plot zebras