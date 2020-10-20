## COVID-2019 shinyapp
## Yiwen Jiang, Monash University (yjia0021@student.monash.edu), last updated October 2020


# Load required packages
library(COVID19dashboard)
library(shiny)
library(tidyverse)
library(rnaturalearth)
library(plotly)
library(shinydashboard)
library(lubridate)
library(scales)
library(kableExtra)
library(here)


########## Load data ################

world_sf <- ne_countries(scale = "medium", returnclass = "sf")

visitor_map <- world_sf %>%
    inner_join(visitor_map, by = c("adm0_a3" = "Code"))

######### Shiny UI #########

ui <- dashboardPage(
    skin = "black",
    dashboardHeader(title = "Coronavirus Pandemic"),
    dashboardSidebar(sidebarMenu(
        menuItem("Data", tabName = "data", icon = icon("database")),
        menuItem("About", tabName = "about", icon = icon("pen-alt")),
        menuItem("Change in Visitors by Category", tabName = "visitor_category", icon = icon("map-marked-alt")),
        menuItem("COVID-19 Cases/Deaths", tabName = "covid_cases", icon = icon("chart-line"))
    )),
    dashboardBody(
        tabItems(
            # First tab (Data)
            tabItem(tabName = "data",
                    fluidRow(
                        column(width = 3, 
                               # Variables select box
                               box(width = NULL, status = "warning",
                                   selectInput("raw_data_variable", "Select variables:", 
                                               multiple = TRUE,
                                               choices = c("ISO code" = "iso_code",
                                                           "Continent" = "continent",
                                                           "Country name" = "location",
                                                           "Date" = "date",
                                                           "Confirmed cases" = "total_cases",
                                                           "New cases" = "new_cases",
                                                           "Confirmed deaths" = "total_deaths",
                                                           "New deaths" = "new_deaths",
                                                           "Total tests" = "total_tests",
                                                           "New tests" = "new_tests"),
                                               selected = c("iso_code", "continent", 
                                                            "location", "date", 
                                                            "total_cases", "new_cases")))
                        ),
                        column(width = 3,
                               # Rows selection box
                               box(width = NULL, status = "warning",
                                   sliderInput("raw_data_row", "Rows to Show: ", 
                                               min = 5, max = 50,
                                               value = 20))),
                        column(width = 6,  
                               box(width = NULL, status = "warning",
                                   helpText("How you can interact with those plots and what the outputs of those plots?"),
                                   tags$dt("This interactive table shows the worldwide COVID-19 raw data used for this shiny app."), 
                                   tags$li("With the 'Select variable' option in the top left corner, you can select the part of the variables in the raw data."),  
                                   tags$li("With the 'Rows to show' option in the middle, you can select the part of the observations in the raw data."), 
                                   tags$dt("Most of the values of the variables 'Total tests' and 'New tests' are missing.")))
                    ),
                    
                    fluidRow(
                        column(width = 12,
                               box(width = NULL, status = "warning",
                                   tableOutput("rawtable"))) # Display the COVID data)
                    )),
            
            # Second tab (About)
            tabItem(tabName = "about", 
                    h1("About"),
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
            ),
            
            # Third tab (Change in visitors by category)
            tabItem(tabName = "visitor_category",
                    fluidRow(
                        column(width = 3,
                               box(width = NULL, status = "warning",
                                   selectizeInput("visitor_country", "Change country",
                                                  choices = unique(visitors_total$Entity),
                                                  selected = "World Average")
                               ),
                               
                               box(width = NULL, status = "warning",
                                   date_range(visitors_total, 
                                              date_col = "Date",
                                              "visitor_date")
                                   
                                   # Replaced by date_range function
                                   # dateRangeInput("visitor_date", "Date Range: ",
                                   #                start = min(visitors_total$Date),
                                   #                end = max(visitors_total$Date),
                                   #                min = min(visitors_total$Date), 
                                   #                max = max(visitors_total$Date))
                                   )
                        ),
                        
                        column(width = 3,
                               box(width = NULL, status = "warning",
                                   checkboxGroupInput("visitor_place", "Choose a place to show:",
                                                      choices = unique(visitors_total$Places),
                                                      selected = unique(visitors_total$Places)))
                        ),
                        
                        column(width = 6,
                               box(width = NULL, solidHeader = TRUE, status = "warning", 
                                   radioButtons("category", "Choose a category to show:", 
                                                choices = c("Grocery & Pharmacy", 
                                                            "Parks", "Retail & Recreation", 
                                                            "Residential", "Transit Stations", 
                                                            "Workplaces"),
                                                selected = "Parks")))
                    ),
                    
                    fluidRow(
                        # Left column
                        column(width = 6,
                               box(width = NULL, solidHeader = TRUE,
                                   plotOutput("visitors", height = 500))
                        ),
                        
                        # Right column
                        column(width = 6,
                               box(width = NULL, solidHeader = TRUE,
                                   plotOutput("visitor_map", height = 500)))),
                    fluidRow(
                        column(width = 12,
                               box(width = NULL, solidHeader = TRUE,
                                   helpText("How you can interact with those plots and what the outputs of those plots?"),
                                   tags$dt("On the left panel, the line chart shows how community movement in specific locations has changed since the beginning of the pandemic outbreak. With the Change country option in the top left corner, you can switch to another country and the Date range option used to zoom in a specific date range to observe some small trends. The selection box used to select or unselect different places showing in the plot."),
                                   tags$br(),
                                   tags$dt("The map on the right panel presents how the number of visitors to different places has changed relative to the period before the pandemic. By select the places from the above selection box to see The change in the number of visitors to different places relative to the period before the pandemic."),
                                   tags$br(),
                                   tags$li("Retail & Recreation includes places like restaurants, cafes, shopping centres, theme parks, museums, libraries, and movie theatres."),
                                   tags$li("Grocery & Pharmacy includes places like grocery markets, food warehouses, farmers markets, specialty food shops, drug stores, and pharmacies."),
                                   tags$li("Transit Stations includes places like public transport hubs such as subway, bus, and train stations."),
                                   tags$li("Parks includes places like local parks, national parks, public beaches, marinas, dog parks, plazas, and public gardens."))))
            ),
            
            # Forth tab (COVID-19 Cases/Deaths)
            tabItem(tabName = "covid_cases",
                    fluidRow(
                        column(width = 6,
                               fluidRow(
                                   column(width = 6,
                                          box(width = NULL, solidHeader = TRUE, status = "warning", 
                                              radioButtons("covid_category", "METRIC", 
                                                           choices = c("Confirmed Cases" = "total_cases",
                                                                       "Confirmed Deaths" = "total_deaths",
                                                                       "Daily New Cases" = "new_cases",
                                                                       "Daily New Deaths" = "new_deaths"),
                                                           selected = "total_cases"))
                                   ),
                                   
                                   column(width = 6,
                                          box(width = NULL, status = "warning",
                                              dateInput("covid_date", "Choose a date to show:",
                                                        value = "2020-09-27",
                                                        min = min(covid_raw$date), 
                                                        max = max(covid_raw$date))))
                               ),
                               
                               fluidRow(
                                   box(width = NULL, solidHeader = TRUE,
                                       plotlyOutput("covid_num", height = 550)))
                        ),
                        
                        column(width = 6,
                               box(width = NULL, status = "warning",
                                   selectizeInput("covid_country", "Select Countries",
                                                  choices = unique(covid_raw$location),
                                                  multiple = TRUE,
                                                  selected = c("United Kingdom", "United States", "Australia"))
                               ),
                               
                               box(width = NULL, solidHeader = TRUE,
                                   plotOutput("covid", height = 400)
                               ),
                               
                               box(width = NULL, status = "info",
                                   tableOutput("covid_table")))),
                    fluidRow(
                        column(width = 12,
                               box(width = NULL, solidHeader = TRUE,
                                   helpText("How you can interact with those plots and what the outputs of those plots?"),
                                   tags$dt("The left line chart shows how numbers changed over the time period. The line chart includes four types. On the left corner select any type of time series it will present in the line chart. The four types are:"),
                                   tags$br(),
                                   tags$li("Confirmed Cases: Number of cumulative confirmed cases of COVID-19"),
                                   tags$li("Confirmed Deaths: Number of cumulative confirmed deaths of COVID-19"),
                                   tags$li("Daily New Cases: Number of the daily new confirmed cases of COVID-19"),
                                   tags$li("Daily New Deaths: Number of the daily new confirmed death of COVID-19"),
                                   tags$br(),
                                   tags$dt("Any country you might not see immediately you can find via the 'Select Countries' on the left corner. Just type the name in the search box there. The selection will change the displayed countries on the left and right line chart. The Trajectory of COVID-19 Confirmed Cases presents how the daily new cases change with the increase in the number of cumulative cases. When the trend goes to downward it implied the pandemic is getting better."),
                                   tags$br(),
                                   tags$dt("Clicking on any date in the left plot displays the summary table of that day on the table. The countries will be based on your selection which you can compare the numbers on the same day with several countries.")
                               )))
            )
        )
    )
)









######### Shiny Server ##########

server <- function(input, output, session) {
    output$rawtable <- renderTable({
        covid_raw %>% 
            sample_n(input$raw_data_row) %>%
            select(input$raw_data_variable) %>%
            as.data.frame()
    })
    
    output$visitors <- renderPlot({
        visitors_total %>%
            filter(Entity == input$visitor_country,
                   Places == input$visitor_place,
                   Date > input$visitor_date[1] & Date < input$visitor_date[2]) %>%
            ggplot(aes(x = Date, y = values, color = Places)) +
            geom_line() +
            geom_hline(yintercept = c(-100, -50, 0, 50, 100), color = "grey", linetype = "dashed") +
            ylab("") +
            xlab("") +
            ggtitle("The number of visitors change since the beginning of the pandemic") +
            scale_color_manual(values=c("#F1C40F", "#45B39D", "#EC7063", "#EDBB99", "#2E4053", "#884EA0")) +
            theme(legend.position = "bottom",
                  panel.background = element_rect(fill = "transparent"),
                  plot.background = element_rect(fill = "transparent"))
        
    })
    
    output$visitor_map <- renderPlot({
        ggplot(data = visitor_map %>% filter(Date == "2020-08-20",
                                            category %in% input$category)) +
            borders() +
            geom_sf(aes(fill = change), lwd = 0) +
            scale_fill_viridis_c(option = "D") +
            theme_classic() +
            xlab("") + ylab("") +
            ggtitle("The change in the number of visitors to different places  relative to the period before the pandemic") +
            theme(legend.position = "bottom",
                  panel.background = element_rect(fill = "transparent"),
                  plot.background = element_rect(fill = "transparent"))
    })
    
    output$covid <- renderPlot({
        case_dat <- covid_raw %>% 
            filter(location %in% c(input$covid_country)) %>%
            mutate(week = week(date)) %>%
            group_by(location, week) %>%
            summarise(total_cases = mean(total_cases, na.rm = TRUE),
                      new_cases = mean(new_cases, na.rm = TRUE))
        
        ggplot() +
            geom_line(data = case_dat, aes(x = total_cases, y = new_cases, group = location), color = "#839192") +
            geom_point(data = filter(case_dat, week == 39), aes(x = total_cases, y = new_cases), color = "#EC7063") +
            geom_text(data = filter(case_dat, week == 39), aes(x = total_cases, y = new_cases - (1/3)*new_cases, label = location), color = "#45B39D") +
            scale_x_continuous(trans='log10', labels = scales::comma) +
            scale_y_continuous(trans='log10', labels = scales::comma) +
            ggtitle("Trajectory of COVID-19 Confirmed Cases") +
            xlab("Total Confirmed Cases") +
            ylab("New Confirmed Cases") +
            expand_limits(x = c(0, 1e+08)) +
            theme_classic()
    })
    
    output$covid_num <- renderPlotly({
        covid_dat <- covid_raw %>%
            filter(location %in% c(input$covid_country)) %>%
            select(location, date, 
                   total_cases, new_cases, 
                   total_deaths, new_deaths) %>%
            pivot_longer(cols = 3:6, names_to = "category", values_to = "value") %>%
            filter(category == input$covid_category)
        
        covid_plot <- ggplot(data = covid_dat) +
            geom_line(aes(x = date, y = value, color = location)) +
            scale_color_brewer(palette="Set1") +
            scale_y_continuous(labels = scales::comma) +
            ggtitle("Confirmed COVID-19 Cases/Deaths") +
            xlab("") + ylab("Numbers") +
            theme_classic()
        
        ggplotly(covid_plot) %>%
            layout(legend = list(orientation = "h", y = -0.1)) %>%
            config(displayModeBar = FALSE)
    })
    
    output$plotlyClick <- renderPrint(event_data("plotly_click", priority = c("input", "event")))
    
    observeEvent(event_data("plotly_click"), {
        click_df <- event_data("plotly_click")
        date_num <- as_date(click_df$x, origin = lubridate::origin)
        updateDateInput(session, "covid_date", value = date_num)
    })
    
    output$covid_table <- renderTable({
        covid_summ <- covid_raw %>%
            filter(date == input$covid_date,
                   location %in% c(input$covid_country)) %>%
            add_comma(c("total_cases", "new_cases", "total_deaths", "new_deaths"))
        
        # Replaced by add_comma() function
        # covid_summ$`total_cases` <- scales::comma(covid_summ$`total_cases`, accuracy = 1)
        # covid_summ$`new_cases` <- scales::comma(covid_summ$`new_cases`, accuracy = 1)
        # covid_summ$`total_deaths` <- scales::comma(covid_summ$`total_deaths`, accuracy = 1)
        # covid_summ$`new_deaths` <- scales::comma(covid_summ$`new_deaths`, accuracy = 1)
        
        covid_summ %>%
            select("Country" = location,
                   "Cumulative Cases" = total_cases,
                   "Dalit New Cases" = new_cases,
                   "Cumulative Deaths" = total_deaths,
                   "Dalit New Deaths" = new_deaths) %>%
            as.data.frame()
    })
    
}









shinyApp(ui = ui, server = server)



