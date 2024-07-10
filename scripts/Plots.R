#PLOTS

library(tidyverse)
library(here)
library(ggthemes)
library(viridis)
library(rcldf)


#This script assumes you have run the DataWrangling.R script beforehand, as it will build on it instead of repeating it.


##Word Order Plots

###Word Order PN
histo_PN_worder <- ggplot(data = wals_worder_PN,
                               aes(x = WordOrder,
                                   fill = WordOrder)) +
  geom_histogram(stat = "count") + # defining the type of plot
  labs(y = "Number of Languages",
       x= "Word Order") + # renaming the axes
  theme_bw() + # adjusting the theme
  scale_fill_colorblind(guide = FALSE) +
  ggtitle("Frequency of Word Orders in the Pama-Nyunga Languages") # adding a descriptive title
histo_PN_worder #getting a preview

##saving them
ggsave(here("output/histo_PN_worder.png"),
       histo_PN_worder,
       width = 30,
       height = 20,
       units = "cm",
       dpi = 600)


###Word Order nPN

histo_nPN_worder <- ggplot(data = wals_worder_nPN,
                               aes(x = WordOrder,
                                   fill = WordOrder)) +
  geom_histogram(stat = "count") + # defining the type of plot
  labs(y = "Number of Languages",
       x= "Word Order") + # renaming the axes
  theme_bw() + # adjusting the theme
  scale_fill_colorblind(guide = FALSE) +
  ggtitle("Frequency of Word Orders in the Non-Pama-Nyunga Languages") # adding a descriptive title
histo_nPN_worder #getting a preview

##saving them
ggsave(here("output/histo_nPN_worder.png"),
       histo_nPN_worder,
       width = 30,
       height = 20,
       units = "cm",
       dpi = 600)
