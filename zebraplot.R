######## The Great Maryland Zebra Escape

# load packages
library(tidyverse)
library(png)
library(ggimage)
library(ggrepel)

# Timeline of reported zebra counts ----

# August 31: citizen reports seeing a zebra dash in front of a car (https://www.fox5dc.com/news/maryland-man-says-he-spotted-runaway-zebras-outside-upper-marlboro-home)
# September 7: WTOP reports a dazzle of three zebras on the loose (https://wtop.com/prince-georges-county/2021/09/they-will-run-you-over-prince-georges-co-residents-warned-to-steer-clear-of-escaped-zebras/)
# September 9: WaPo & NYT report five zebras (https://www.nytimes.com/2021/09/09/us/zebras-maryland.html) (https://www.washingtonpost.com/dc-md-va/2021/09/08/zebras-escape-maryland-farm/)
# September 10: NBC reports six zebras; Eleanor Holmes Norton denies involvement (https://www.washingtonpost.com/dc-md-va/2021/09/08/zebras-escape-maryland-farm/)


# Create dataframe ----

date <- seq(as.Date('2021-08-28'), as.Date('2021-09-21'), by = 'days')

zebras <- data.frame(date) %>%
  mutate(count = NA) %>%
  mutate(count = ifelse(date < '2021-08-31', 0, count)) %>% 
  mutate(count = ifelse(date >= '2021-08-31' & date <= '2021-09-06', 1, count)) %>% 
  mutate(count = ifelse(date == '2021-09-07' | date == '2021-09-08', 3, count)) %>% 
  mutate(count = ifelse(date == '2021-09-09', 5, count)) %>% 
  mutate(count = ifelse(date >= '2021-09-10' & date < '2021-09-21', 6, count))  

img <- readPNG("zebra2.png", native=TRUE)

zebras <- zebras %>%
  mutate(IMAGE = ifelse(date== '2021-08-30' | date =='2021-08-31' | date == '2021-09-07' | date == '2021-09-09' | date == '2021-09-10' | date == '2021-09-09', "zebra.png", NA))
  
# simple plot ----

p <- ggplot(zebras, aes(x=date, y=count)) + 
  geom_line() +
  labs(title = "Changes in Reported Count of Escaped Zebras in Maryland (Sept. 2021)", x = "Date", y = "Reported zebras at large") +
  scale_y_continuous(limits=c(0,6), breaks = seq(0, 6, by = 1)) +
  scale_x_date(date_labels = "%b %d", breaks = "2 days", expand=c(0,0)) +
  geom_image(aes(image = IMAGE), size = 0.07) +
  theme(
    panel.background = element_rect(fill = "lightblue",
                                    colour = "lightblue",
                                    size = 0.3, linetype = "solid"),
    panel.grid.major = element_line(size = 0.3, linetype = 'solid',
                                    colour = "white"), 
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                    colour = "white")
  ) + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  annotate(
    "text", label = "Tripwire trap",
    x = as.Date('2021-09-11'), y = 4.65, size = 3, colour = "black"
  ) +
  annotate(
    "text", label = "construction begins",
    x = as.Date('2021-09-11'), y = 4.35, size = 3, colour = "black"
  ) +
  annotate(
    "text", label = "6 zebras still at large",
    x = as.Date('2021-09-18'), y = 5.75, size = 3, colour = "black"
  )

p



 