


map_AUS <- get_stadiamap(bbox = c(left = 112, 
                                  bottom = -44,
                                  right = 154,
                                  top = -11), #here the map boundaries given by ChatGPT earlier came in handy again
                         zoom = 5,
                         maptype = "stamen_toner_lite",
                         color = "color")
ggmap(map_AUS)



map_AUS_family <- ggmap(map_AUS) +
  geom_point(data = wals_aus,
             aes(x = Longitude,
                 y = Latitude,
                 color = Family),
             size = 9) +
  scale_color_colorblind() + #better color
  theme_map() + #removes axes labels and puts the legend in bottom left corner of map
  theme(legend.text = element_text(size = 10),
        legend.title = element_text(size =12)) +
  #        legend.position.inside = c(0.9,0)) + #we can still modify it to our liking 
  labs(color = "Families")
map_AUS_family

ggsave(here("/output/map_AUS_family.png"),
       map_AUS_family,
       width = 30,
       height = 30,
       units = "cm",
       dpi = 600)
