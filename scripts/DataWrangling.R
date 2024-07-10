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


#This creates a tibble that will be manipulated further at different points.
wals_value <- as.cldf.wide(wals_cldf, "ValueTable") %>% 
  filter(Macroarea == "Australia")
glimpse(wals_value)




##Word Order Data Wrangling
###creates two seperate df, for PN and nPN respectively. Also renames relevant columns to be more descriptive.

wals_worder_PN <- wals_value %>% 
  filter( Chapter_ID == "81" &
            Family == "Pama-Nyungan") %>% 
  rename("WordOrder" = "Name.CodeTable")

wals_worder_nPN <- wals_value %>% 
  filter( Chapter_ID == "81" &
            Family != "Pama-Nyungan") %>% 
  rename("WordOrder" = "Name.CodeTable")

##Reduplication
###essentially the same process as above, but for a different Feature

wals_redupli_PN <- wals_value %>% 
  filter( Chapter_ID == "27" &
            Family == "Pama-Nyungan") %>% 
  rename("Reduplication" = "Name.CodeTable")


wals_redupli_nPN <- wals_value %>% 
  filter( Chapter_ID == "27" &
            Family != "Pama-Nyungan") %>% 
  rename("Reduplication" = "Name.CodeTable")
