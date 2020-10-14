## code to prepare `visitors_total` dataset goes here

library(tidyverse)


# Data of visitor numbers to specific categories of location

vistors <- read_csv("data-raw/visitors_total/changes-visitors-covid.csv") 

visitors_total <- vistors %>%
  group_by(Date) %>%
  summarise(Entity = "World Average",
            Code = "World", 
            `Retail & Recreation` = mean(`Retail & Recreation`, na.rm = TRUE),
            `Grocery & Pharmacy` = mean(`Grocery & Pharmacy`, na.rm = TRUE),
            Parks = mean(Parks, na.rm = TRUE),
            `Transit Stations` = mean(`Transit Stations`, na.rm = TRUE),
            Workplaces = mean(Workplaces, na.rm = TRUE),
            Residential = mean(Residential, na.rm = TRUE)) %>%
  dplyr::select(Entity, Code, Date, 
         `Retail & Recreation`, 
         `Grocery & Pharmacy`, Parks,
         `Transit Stations`, Workplaces,
         Residential) %>%
  bind_rows(vistors) %>%
  pivot_longer(cols = 4:9, names_to = "Places", values_to = "values")




usethis::use_data(visitors_total, overwrite = TRUE)
