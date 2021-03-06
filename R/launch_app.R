#' Launch the COVID-19 shiny dashboard
#' 
#' The `launch_app()` function is used to load the coronavirus pandemic shiny application.
#' This function normally does not return; interrupt R to stop the application (usually by pressing Ctrl+C or Esc).
#' 
#' @param data A dataset containing COVID-19 relevant information.
#' 
#' @details 
#' The coronavirus pandemic, also known as the COVID-19 pandemic. 
#' The disease was first identified in December 2019 in Wuhan, China. 
#' The outbreak was declared a Public Health Emergency of International Concern in January 2020, and a pandemic in March 2020. 
#' As of 11 October 2020, more than 37.2 million cases have been confirmed as well as more than 1.07 million deaths attributed to COVID-19. 
#' This shiny dashboard aims to complement the raw data by providing interactive visualisation which is not available by the news, 
#' including the timeline function and the ability to compare between countries.
#' 
#' @format NULL
#' @usage NULL
#' 
#' @examples 
#' \dontrun{
#' launch_app()
#' }
#' 
#' @export

launch_app <- function() {
  appDir <- system.file("app", package = "COVID19dashboard")
  if (appDir == "") {
    stop("Could not find shiny app in the directory. Try re-installing `COVID19dashboard`.", call. = FALSE)
    }
  
  shiny::runApp(appDir, display.mode = "normal")
}



