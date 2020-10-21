#' Add a note box into shiny app
#' 
#' `shiny_note()` is a function that inserts a box that contains elements of note. 
#' Using HTML tags to write you own notes for your shiny app, 
#' including How to interactive with the app, what does the output mean
#' 
#' @param ... HTML tags used to add text into shiny app
#' 
#' 
#' 
#' 
#' @examples 
#' \dontrun{
#' shiny_note(
#'     tags$h3("Background & Purpose of this app"),
#'     h5("In December 2019..."),
#'     tags$h3("Code"),
#'     "Code and input data used to generate this Shiny app are available on..."
#'     )
#' }
#' 
#' @import shinydashboard
#' 
#' 
#' @export
shiny_note <- function(...){
  
  box(width = NULL, status = "warning",
      helpText("How you can interact with those plots and what the outputs of those plots?"),
      ...
      )
  
}

