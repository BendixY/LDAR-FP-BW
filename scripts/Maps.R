


map_AUS <- get_stadiamap(bbox = c(left = 113, 
                                  bottom = -44,
                                  right = 154,
                                  top = -9), #here the map boundaries given by ChatGPT earlier came in handy again
                         zoom = 3,
                         maptype = "stamen_toner_lite",
                         color = "color")
ggmap(map_AUS)



map_AUS_family <- ggmap(map_AUS) +
  geom_point(data = wals_aus,
             aes(x = Longitude,
                 y = Latitude,
                 color = Family),
             show.legend = T) +
  scale_color_viridis(discrete = T) + #better color
  theme_map() + #removes axes labels and puts the legend in bottom left corner of map
  theme(legend.text = element_text(size = 10),
        legend.title = element_text(size = 12)) +
  labs(color = "Families")
map_AUS_family

ggsave(here("/output/map_AUS_family.png"),
       map_AUS_family,
       width = 30,
       height = 30,
       units = "cm",
       dpi = 600)
