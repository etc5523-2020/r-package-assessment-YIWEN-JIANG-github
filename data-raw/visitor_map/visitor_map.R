## code to prepare `visitor_map` dataset goes here

library(tidyverse)
library(rnaturalearth)
library(rnaturalearthdata)

# World map data
world_sf <- ne_countries(scale = "medium", returnclass = "sf") 

visitor_category <- read_csv("data-raw/visitor_map/change-visitors-grocery-stores.csv") %>%
  full_join(read_csv("data-raw/visitor_map/change-visitors-parks-covid.csv"), by = c("Entity", "Code", "Date")) %>%
  full_join(read_csv("data-raw/visitor_map/change-visitors-retail-recreation.csv"), by = c("Entity", "Code", "Date")) %>%
  full_join(read_csv("data-raw/visitor_map/changes-residential-duration-covid.csv"), by = c("Entity", "Code", "Date")) %>%
  full_join(read_csv("data-raw/visitor_map/visitors-transit-covid.csv"), by = c("Entity", "Code", "Date")) %>%
  full_join(read_csv("data-raw/visitor_map/workplace-visitors-covid.csv"), by = c("Entity", "Code", "Date")) %>%
  pivot_longer(cols = 4:9, names_to = "category", values_to = "change")

visitor_map <- world_sf %>%
  inner_join(visitor_category, by = c("adm0_a3" = "Code"))



usethis::use_data(visitor_map, overwrite = TRUE)
