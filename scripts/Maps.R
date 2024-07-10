library(tidyverse)
library(here)
library(ggmap)
library(ggthemes)
library(maps)

#This script assumes you have run the DataWrangling.R script beforehand, as it mainly builds on it instead of repeating it.

map_AUS <- get_stadiamap(bbox = c(left = 113, 
                                  bottom = -44,
                                  right = 154,
                                  top = -9), #here the map boundaries given by ChatGPT earlier came in handy again
                         zoom = 3,
                         maptype = "stamen_toner_lite",
                         color = "color")
ggmap(map_AUS)

#This map will show the distribution of PN and nPN languages. While reductionist, I want to make it easier to read, so I mutate all nPN languages to simply "Non-Pama-Nyungan"

wals_nPN <- wals_value %>% 
  mutate(Family = if_else(Family == "Pama-Nyungan", "Pama-Nyungan", "Non-Pama-Nyungan"))



map_AUS_family <- ggmap(map_AUS) +
  geom_point(data = wals_nPN,
             aes(x = Longitude,
                 y = Latitude,
                 color = Family),
             show.legend = T) +
  scale_color_colorblind() + #better color
  theme_map() + #removes axes labels and puts the legend in bottom left corner of map
  theme(legend.text = element_text(size = 10),
        legend.title = element_text(size = 12)) +
  labs(color = "Families")
map_AUS_family

ggsave(here("output/map_AUS_family.png"),
       map_AUS_family,
       width = 30,
       height = 30,
       units = "cm",
       dpi = 600)



#a different map that shows the dominant word order of Australian languages
#first we need to filter for data that entails the Word order. This is chapter 81 of WALS. we further seperate them by PN and nPN

##PN
map_PN_worder <- ggmap(map_AUS) +
  geom_point(data = wals_worder_PN,
             aes( x = Longitude,
                  y = Latitude,
                  color = WordOrder),
             show.legend = T) +
  theme_map() +
  theme(legend.text = element_text(size = 10),
        legend.title = element_text(size = 12)) +
  labs(color = "Dominant Word Order")
map_PN_worder

ggsave(here("output/map_PN_worder.png"),
       map_PN_worder,
       width = 30,
       height = 30,
       units = "cm",
       dpi = 600)

##nPN
map_nPN_worder <- ggmap(map_AUS) +
  geom_point(data = wals_worder_nPN,
             aes( x = Longitude,
                  y = Latitude,
                  color = WordOrder),
             show.legend = T) +
  theme_map() +
  theme(legend.text = element_text(size = 10),
        legend.title = element_text(size = 12)) +
  labs(color = "Dominant Word Order")
map_nPN_worder

ggsave(here("output/map_nPN_worder.png"),
       map_nPN_worder,
       width = 30,
       height = 30,
       units = "cm",
       dpi = 600)

