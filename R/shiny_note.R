#' Add a note box into shiny app
#' 
#' `shiny_note()` is a function that inserts a box that contains elements of note. 
#' Using HTML tags to write you own notes for your shiny app, 
#' including How to interactive with the app, what does the output mean
#' 
#' @param ... HTML tags used to add text into shiny app
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
#' @importFrom graphics box
#' 
#' @examples 
#' shiny_note(
#'     tags$h3("Background & Purpose of this app"),
#'     h5("In December 2019, cases of severe respiratory illness began to be reported across the city of Wuhan in China. These were caused by a new type of coronavirus, and the disease is now commonly referred to as COVID-19. The number of COVID-19 cases started to escalate more quickly in mid-January and the virus soon spread beyond China's borders. This story has been rapidly evolving ever since, and each day we are faced by worrying headlines regarding the current state of the outbreak."),
#'     h5("In isolation, these headlines can be hard to interpret. How fast is the virus spreading? How does the situation difference between countries? What kind of changes has been made to people’s lifestyles in response to the pandemic?"),
#'     h5("This site is the visualisation of the COVID-19 datasets which are provided by Our World in Data. By looking beyond the headlines, we hope it is possible to get a deeper understanding of this unfolding pandemic."),
#'     tags$h3("Code"),
#'     "Code and input data used to generate this Shiny app are available on ",tags$a(href="https://github.com/etc5523-2020/shiny-assessment-YIWEN-JIANG-github.git", "Github.")
#'     )
#' 
#' @export
shiny_note <- function(...){
  
  box(width = NULL, status = "warning",
      helpText("How you can interact with those plots and what the outputs of those plots?"),
      ...
      )
}

