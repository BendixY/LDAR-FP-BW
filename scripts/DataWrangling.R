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
  rename("WordOrder" = "Name.CodeTable") %>% 
  mutate(WordOrder = factor(WordOrder,
                               levels = c("SOV",
                                          "SVO",
                                          "VOS",
                                          "OSV",
                                          "No dominant order")))

wals_worder_nPN <- wals_value %>% 
  filter( Chapter_ID == "81" &
            Family != "Pama-Nyungan") %>% 
  rename("WordOrder" = "Name.CodeTable") %>%  
  mutate(WordOrder = factor(WordOrder,
                            levels = c("SOV",
                                       "SVO",
                                       "SVO or VOS",
                                       "OSV",
                                       "No dominant order"))) %>% 
  mutate(WordOrder = case_when( #this bit was added as three languages didn't have entries in the new WordOrder Column. Thankfully the necessary information was in the Column next to it, so we add it back in
    Language_ID.ValueTable == "ung" ~ "OVS",
    Language_ID.ValueTable == "myi" ~ "OVS",
    Language_ID.ValueTable == "grr" ~ "SVO or VOS",  
    TRUE ~ WordOrder))
glimpse(wals_worder_nPN)

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
