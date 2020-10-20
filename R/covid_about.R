#' Add about page into shiny app
#' 
#' `add_comma()` is a function that inserts a comma every three digits for columns in a dataframe.
#' 
#' @param data A data frame, data frame extension (e.g. a tibble), 
#' or a lazy data frame (e.g. from dbplyr or dtplyr). 
#' @param col Columns that inserts a comma every three digits
#' 
#' @details 
#' 
#' 
#' 
#' 
#' 
#' @format NULL
#' @usage 
#' 
#' @examples 
#' df <- add_comma(covid_raw, c("total_cases", "new_cases"))
#' view(df)
#' 
#' @export

covid_about <- function(){
  tags$div(
    tags$h3("Background & Purpose of this app"),
    h5("In December 2019, cases of severe respiratory illness began to be reported across the city of Wuhan in China. These were caused by a new type of coronavirus, and the disease is now commonly referred to as COVID-19. The number of COVID-19 cases started to escalate more quickly in mid-January and the virus soon spread beyond China's borders. This story has been rapidly evolving ever since, and each day we are faced by worrying headlines regarding the current state of the outbreak."),
    h5("In isolation, these headlines can be hard to interpret. How fast is the virus spreading? How does the situation difference between countries? What kind of changes has been made to people’s lifestyles in response to the pandemic?"),
    h5("This site is the visualisation of the COVID-19 datasets which are provided by Our World in Data. By looking beyond the headlines, we hope it is possible to get a deeper understanding of this unfolding pandemic."),
    tags$h3("Code"),
    "Code and input data used to generate this Shiny app are available on ",tags$a(href="https://github.com/etc5523-2020/shiny-assessment-YIWEN-JIANG-github.git", "Github."),
    tags$br(),
    tags$h3("Sources"),
    tags$b("2019-COVID cases: "), tags$a(href="https://covid.ourworldindata.org/data/owid-covid-data.csv", "coronavirus-data-explorer.csv"),
    tags$br(),
    tags$b("2019-COVID visitors: "), tags$a(href="https://www.gstatic.com/covid19/mobility/Global_Mobility_Report.csv", "changes-visitors-covid.csv"),
    tags$br(), 
    tags$h3("Author"),
    tags$b("Yiwen Jiang: "), 
    "Student of the Department of Econometrics and Business Statistics at Monash University",
    tags$br(),
    tags$h3("Last update"), 
    "October 2020",
    tags$br(),
    tags$h3("Reference"),
    tags$h5("Andy South (2017). rnaturalearthdata: World Vector Map Data from Natural Earth Used in 'rnaturalearth'. R package version 0.1.0. https://CRAN.R-project.org/package=rnaturalearthdata"),
    tags$h5("C. Sievert. Interactive Web-Based Data Visualization with R, plotly, and shiny. Chapman and Hall/CRC Florida, 2020."),
    tags$h5("Garrett Grolemund, Hadley Wickham (2011). Dates and Times Made Easy with lubridate. Journal of Statistical Software, 40(3), 1-25. URL http://www.jstatsoft.org/v40/i03/."),
    tags$h5("Hadley Wickham and Dana Seidel (2020). scales: Scale Functions for Visualization. R package version 1.1.1. https://CRAN.R-project.org/package=scales"),
    tags$h5("Max Roser, Esteban Ortiz-Ospina, Hannah Ritchie, and Joe Hasell. 2020. “Coronavirus Pandemic (Covid-19).” Our World in Data."),
    tags$h5("Winston Chang, Joe Cheng, JJ Allaire, Yihui Xie and Jonathan McPherson (2020). shiny: Web Application Framework for R. R package version 1.5.0. https://CRAN.R-project.org/package=shiny"),
    tags$h5("Wickham et al., (2019). Welcome to the tidyverse. Journal of Open Source Software, 4(43), 1686, https://doi.org/10.21105/joss.01686"),
    tags$h5("Winston Chang and Barbara Borges Ribeiro (2018). shinydashboard: Create Dashboards with 'Shiny'. R package version 0.7.1. https://CRAN.R-project.org/package=shinydashboard"))
}





