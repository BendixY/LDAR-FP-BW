##Data Wrangling

#loading packages

library(here)
library(tidyverse)
library(rcldf)



##loading in data from phoible and WALS and limiting them to languages spoken in Australia
#Let's start with WALS

wals_cldf <- cldf(here("data/WALS/cldf"))
#this loads the cldf data, but is not yet manipulable. Do to this, we need to get it into a dataframe or tibble format
summary(wals_cldf)

#This creates a tibble
wals_value <- as.cldf.wide(wals_cldf, "ValueTable") %>% 
  filter(Macroarea == "Australia")

wals_lang <- read_csv(here("data/WALS/cldf/languages.csv")) %>% 
  filter( #Latitude >= -44 & Latitude <= -11 & 
           #Longitude >= 112 & Longitude <= 154 &
           Macroarea == "Australia")
#boundaries were determined with the help of ChatGPT 4.o but ended up not being helpful enough. i left the code in in case i might need it at another time
glimpse(wals_lang)


#Now we do the same with the data by phoible
phoible_cldf <- cldf(here("data/phoible/cldf-datasets/cldf"))
summary(phoible_cldf)

phoible_value <- as.cldf.wide(phoible_cldf, "ValueTable") 
phoible_Language <- as.cldf.wide(phoible_cldf, "LanguageTable") %>% 
  filter(Macroarea == "Australia")

#We join these two to create a single tibble containing more information
phoible_joined <- phoible_Language %>% 
  left_join(phoible_value, by = c("ID" = "Language_ID"))
