## code to prepare `covid_raw` dataset goes here

library(readr)

# COVID-19 data from world wide
covid_raw <- read_csv("data-raw/covid_raw/owid-covid-data.csv") 

usethis::use_data(covid_raw, overwrite = TRUE)
