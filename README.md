
<!-- README.md is generated from README.Rmd. Please edit that file -->

# COVID19dashboard

<!-- badges: start -->

<!-- badges: end -->

The goal of COVID19dashboard is to …

## Installation

<!-- You can install the released version of COVID19dashboard from [CRAN](https://CRAN.R-project.org) with: -->

<!-- ``` r -->

<!-- install.packages("COVID19dashboard") -->

<!-- ``` -->

The development version can be installed from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("etc5523-2020/r-package-assessment-YIWEN-JIANG-github")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(COVID19dashboard)
library(tibble)
covid_raw
#> # A tibble: 46,484 x 41
#>    iso_code continent location date       total_cases new_cases new_cases_smoot…
#>    <chr>    <chr>     <chr>    <date>           <dbl>     <dbl>            <dbl>
#>  1 AFG      Asia      Afghani… 2019-12-31           0         0               NA
#>  2 AFG      Asia      Afghani… 2020-01-01           0         0               NA
#>  3 AFG      Asia      Afghani… 2020-01-02           0         0               NA
#>  4 AFG      Asia      Afghani… 2020-01-03           0         0               NA
#>  5 AFG      Asia      Afghani… 2020-01-04           0         0               NA
#>  6 AFG      Asia      Afghani… 2020-01-05           0         0               NA
#>  7 AFG      Asia      Afghani… 2020-01-06           0         0                0
#>  8 AFG      Asia      Afghani… 2020-01-07           0         0                0
#>  9 AFG      Asia      Afghani… 2020-01-08           0         0                0
#> 10 AFG      Asia      Afghani… 2020-01-09           0         0                0
#> # … with 46,474 more rows, and 34 more variables: total_deaths <dbl>,
#> #   new_deaths <dbl>, new_deaths_smoothed <dbl>, total_cases_per_million <dbl>,
#> #   new_cases_per_million <dbl>, new_cases_smoothed_per_million <dbl>,
#> #   total_deaths_per_million <dbl>, new_deaths_per_million <dbl>,
#> #   new_deaths_smoothed_per_million <dbl>, new_tests <lgl>, total_tests <lgl>,
#> #   total_tests_per_thousand <lgl>, new_tests_per_thousand <lgl>,
#> #   new_tests_smoothed <lgl>, new_tests_smoothed_per_thousand <lgl>,
#> #   tests_per_case <lgl>, positive_rate <lgl>, tests_units <lgl>,
#> #   stringency_index <dbl>, population <dbl>, population_density <dbl>,
#> #   median_age <dbl>, aged_65_older <dbl>, aged_70_older <dbl>,
#> #   gdp_per_capita <dbl>, extreme_poverty <dbl>, cardiovasc_death_rate <dbl>,
#> #   diabetes_prevalence <dbl>, female_smokers <dbl>, male_smokers <dbl>,
#> #   handwashing_facilities <dbl>, hospital_beds_per_thousand <dbl>,
#> #   life_expectancy <dbl>, human_development_index <dbl>
```
