#' World wide COVID-19 Pandemic dataset
#'
#' This dataset contains COVID-19 information of 212 countries from December 31, 2019, to September 27, 2020.
#'
#'
#' @source
#' Our World in Data
#' <https://ourworldindata.org/coronavirus>
#' 
#' 
#' @format Data frame with columns
#' \describe{
#' \item{iso_code, continent, location}{Location information}
#' \item{date}{Date in YYYY-MM-DD format.}
#' \item{total_cases, new_cases, new_cases_smoothed, total_cases_per_million, new_cases_per_million, new_cases_smoothed_per_million}{Case-related numbers}
#' \item{total_deaths, new_deaths, new_deaths_smoothed, total_deaths_per_million, new_deaths_per_million, new_deaths_smoothed_per_million}{Death-related numbers}
#' \item{new_tests, total_tests, total_tests_per_thousand, new_tests_per_thousand, new_tests_smoothed, new_tests_smoothed_per_thousand, tests_per_case, positive_rate, tests_units}{Test-related numbers}
#' }
#' 
#' @details The data contains the daily summary of COVID-19 cases 
#' (confirmed and death), by country.
#' 
#' 
#' 
#' @name covid_raw
#' 
#' 
#' @keywords datasets
#' 
#' @examples
#' library(COVID19dashboard)
#' covid_raw
#' 
#' 
#' 
"covid_raw"