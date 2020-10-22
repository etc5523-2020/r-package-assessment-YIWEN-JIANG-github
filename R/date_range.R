#' Create date range input
#' 
#' `date_range` is a function that creates date range input into the shiny app. 
#' When clicked on, bring up calendars that the user can click on to select dates.
#' 
#' @param data The data used to create tables to plots which are correlated to the input
#' @param date_col The column name in the data which contain the date information. The default value is `date`.
#' @param input_id The input slot that will be used to access the value.
#' 
#' @details 
#' The date `format` string specifies how the date will be displayed in the browser. It allows the following values:
#' \itemize{
#'   \item `yy` Year without century (12)
#'   \item `yyyy` Year with century (2012)
#'   \item `mm` Month number, with leading zero (01-12)
#'   \item `m` Month number, without leading zero (1-12)
#'   \item `M` Abbreviated month name
#'   \item `MM` Full month name
#'   \item `dd` Day of month with leading zero
#'   \item `d` Day of month without leading zero
#'   \item `D` Abbreviated weekday name
#'   \item `DD` Full weekday name
#' }
#' 
#' 
#' @seealso [dateInput()], [updateDateRangeInput()]
#' 
#' 
#' @import shiny
#' 
#' @examples 
#' ## Only run examples in interactive R sessions
#' if (interactive()) {
#'
#' ui <- fluidPage(
#'   date_range(covid_raw, "daterange"))
#'                  
#' shinyApp(ui, server = function(input, output) { })
#' }
#' 
#' @export
date_range <- function(data, date_col = "date", input_id){
  
  min_date <- min(data[[date_col]])
  max_date <- max(data[[date_col]])
  start_date <- min(data[[date_col]])
  end_date <- max(data[[date_col]])
  
  dateRangeInput(input_id, "Date Range: ",
                 start = start_date,
                 end = end_date,
                 min = min_date, 
                 max = max_date)
}









