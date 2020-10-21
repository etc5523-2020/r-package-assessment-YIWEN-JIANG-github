## code to prepare `visitor_map` dataset goes here

library(tidyverse)
library(rnaturalearth)
library(rnaturalearthdata)

visitor_map <- read_csv("data-raw/visitor_map/change-visitors-grocery-stores.csv") %>%
  full_join(read_csv("data-raw/visitor_map/change-visitors-parks-covid.csv"), by = c("Entity", "Code", "Date")) %>%
  full_join(read_csv("data-raw/visitor_map/change-visitors-retail-recreation.csv"), by = c("Entity", "Code", "Date")) %>%
  full_join(read_csv("data-raw/visitor_map/changes-residential-duration-covid.csv"), by = c("Entity", "Code", "Date")) %>%
  full_join(read_csv("data-raw/visitor_map/visitors-transit-covid.csv"), by = c("Entity", "Code", "Date")) %>%
  full_join(read_csv("data-raw/visitor_map/workplace-visitors-covid.csv"), by = c("Entity", "Code", "Date")) %>%
  pivot_longer(cols = 4:9, names_to = "category", values_to = "change")


usethis::use_data(visitor_map, overwrite = TRUE)
