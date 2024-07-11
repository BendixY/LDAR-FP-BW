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


#Worder Plot for PM, fill = genus
histogram_PNGenus_worder <- ggplot(data = filter(wals_worder_PN),
                              aes(x = WordOrder,
                                  fill = Genus)) +
  geom_histogram(stat = "count") + # defining the type of plot
  labs(y = "Number of Languages",
       x = "Word Order") + # renaming the axes
  theme_bw() + # adjusting the theme
  scale_fill_colorblind() +
  ggtitle("Frequency of Word Orders in Pama-Nyungan Subfamilies") # adding a descriptive title
histogram_PNGenus_worder #getting a preview

##saving it
ggsave(here("output/histogram_PNGenus_worder.png"),
       histogram_PNGenus_worder,
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

##saving it
ggsave(here("output/histo_nPN_worder.png"),
       histo_nPN_worder,
       width = 30,
       height = 20,
       units = "cm",
       dpi = 600)


### Consonant Inventory plots
##PN
#Consonant Inventory
histo_PN_cons <- ggplot(data = wals_cons_PN,
                          aes(x = ConsonantInventories,
                              fill = ConsonantInventories)) +
  geom_histogram(stat = "count") + # defining the type of plot
  labs(y = "Number of Languages",
       x= "Size of Consonant Inventory") + # renaming the axes
  theme_bw() + # adjusting the theme
  scale_fill_colorblind(guide = FALSE) +
  ggtitle("Sizes of Consonant Inventories in Pama-Nyunga Languages") # adding a descriptive title
histo_PN_cons #getting a preview

##saving it
ggsave(here("output/histo_PN_cons.png"),
       histo_PN_cons,
       width = 30,
       height = 20,
       units = "cm",
       dpi = 600)


#Vowel Quality Inventory
histo_PN_vowels <- ggplot(data = wals_vowels_PN,
                        aes(x = VowelQualityInventories,
                            fill = VowelQualityInventories)) +
  geom_histogram(stat = "count") + # defining the type of plot
  labs(y = "Number of Languages",
       x= "Size of Vowel Quality Inventory") + # renaming the axes
  theme_bw() + # adjusting the theme
  scale_fill_colorblind(guide = FALSE) +
  ggtitle("Sizes of Vowel Quality Inventories in Pama-Nyunga Languages") # adding a descriptive title
histo_PN_vowels #getting a preview

##saving it
ggsave(here("output/histo_PN_vowels.png"),
       histo_PN_vowels,
       width = 30,
       height = 20,
       units = "cm",
       dpi = 600)

#Consonant/Vowel Ratio

histo_PN_ratio <- ggplot(data = wals_ratio_PN,
                          aes(x = ConsonantVowelRatio,
                              fill = ConsonantVowelRatio)) +
  geom_histogram(stat = "count") + # defining the type of plot
  labs(y = "Number of Languages",
       x= "Consonant to Vowel Ratio") + # renaming the axes
  theme_bw() + # adjusting the theme
  scale_fill_colorblind(guide = FALSE) +
  ggtitle("Ratios of Consonants to Vowels in Pama-Nyunga Languages") # adding a descriptive title
histo_PN_ratio #getting a preview

##saving it
ggsave(here("output/histo_PN_ratio.png"),
       histo_PN_ratio,
       width = 30,
       height = 20,
       units = "cm",
       dpi = 600)


##nPN
#Consonant Inventory
histo_nPN_cons <- ggplot(data = wals_cons_nPN,
                        aes(x = ConsonantInventories,
                            fill = ConsonantInventories)) +
  geom_histogram(stat = "count") + # defining the type of plot
  labs(y = "Number of Languages",
       x= "Size of Consonant Inventory") + # renaming the axes
  theme_bw() + # adjusting the theme
  scale_fill_colorblind(guide = FALSE) +
  ggtitle("Sizes of Consonant Inventories in Non-Pama-Nyungan Languages") # adding a descriptive title
histo_nPN_cons #getting a preview

##saving it
ggsave(here("output/histo_nPN_cons.png"),
       histo_nPN_cons,
       width = 30,
       height = 20,
       units = "cm",
       dpi = 600)


#Vowel Quality Inventory
histo_nPN_vowels <- ggplot(data = wals_vowels_nPN,
                          aes(x = VowelQualityInventories,
                              fill = VowelQualityInventories)) +
  geom_histogram(stat = "count") + # defining the type of plot
  labs(y = "Number of Languages",
       x= "Size of Vowel Quality Inventory") + # renaming the axes
  theme_bw() + # adjusting the theme
  scale_fill_colorblind(guide = FALSE) +
  ggtitle("Sizes of Vowel Quality Inventories in Non-Pama-Nyungan Languages") # adding a descriptive title
histo_nPN_vowels #getting a preview

##saving it
ggsave(here("output/histo_nPN_vowels.png"),
       histo_nPN_vowels,
       width = 30,
       height = 20,
       units = "cm",
       dpi = 600)

#Consonant/Vowel Ratio

histo_nPN_ratio <- ggplot(data = wals_ratio_nPN,
                         aes(x = ConsonantVowelRatio,
                             fill = ConsonantVowelRatio)) +
  geom_histogram(stat = "count") + # defining the type of plot
  labs(y = "Number of Languages",
       x= "Consonant to Vowel Ratio") + # renaming the axes
  theme_bw() + # adjusting the theme
  scale_fill_colorblind(guide = FALSE) +
  ggtitle("Ratios of Consonants to Vowels in Non-Pama-Nyungan Languages") # adding a descriptive title
histo_nPN_ratio #getting a preview

##saving it
ggsave(here("output/histo_nPN_ratio.png"),
       histo_nPN_ratio,
       width = 30,
       height = 20,
       units = "cm",
       dpi = 600)
