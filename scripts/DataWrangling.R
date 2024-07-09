##Data Wrangling

#loading packages

library(here)
library(tidyverse)
library(rcldf)



#loading in data from phoible and WALS and limiting them to languages spoken in Australia

phoible <- read_csv(here("data/phoible/phoible.csv")) 
glimpse(phoible)

wals_cldf <- cldf(here("data/WALS/cldf"))
summary(wals_cldf)

names(wals_cldf$tables)

wals_lang <- read_csv(here("data/WALS/cldf/languages.csv")) %>% 
  filter( #Latitude >= -44 & Latitude <= -11 & 
           #Longitude >= 112 & Longitude <= 154 &
           Macroarea == "Australia")
#boundaries were determined with the help of ChatGPT 4.o but ended up not being helpful enough. i left the code in in case i might need it at another time
glimpse(wals_lang)


