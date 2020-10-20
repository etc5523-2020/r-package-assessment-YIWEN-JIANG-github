#' Label numbers in decimal format (e.g. 1,234)
#' 
#' `add_comma()` is a function that inserts a comma every three digits for columns in a dataframe.
#' 
#' @param data A data frame, data frame extension (e.g. a tibble), 
#' or a lazy data frame (e.g. from dbplyr or dtplyr). 
#' @param col Columns that inserts a comma every three digits
#' 
#' @details NULL
#' 
#' 
#' @import 
#' 
#' 
#' @format NULL
#' @usage NULL
#' 
#' @import tibble, scales
#' 
#' @examples 
#' df <- add_comma(covid_raw, c("total_cases", "new_cases"))
#' view(df)
#' 
#' @export
add_comma <- function(data, col){
  for (var in col){
    data[[var]] <- scales::comma(data[[var]], accuracy = 1)
  }
  return(data)
}


