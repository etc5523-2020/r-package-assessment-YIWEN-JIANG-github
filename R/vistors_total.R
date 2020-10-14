#' World wide the number of visitors change since the beginning of the pandemic
#'
#' The data contains the information of how visitors to (or time spent in) categorized places change compared to the baseline days. 
#' A baseline day represents a normal value for that day of the week. 
#' The baseline day is the median value from the 5‑week period Jan 3 – Feb 6, 2020.
#'
#' @source
#' Google: Community Mobility Reports
#' <https://www.google.com/covid19/mobility/>
#' 
#' 
#' @format Data frame with columns
#' \describe{
#' \item{Entity}{Name of countries or territories}
#' \item{Code}{Country code}
#' \item{Date}{Date of the information been recorded}
#' \item{Places}{Categorized places}
#' \item{values}{Changes compared to our baseline days}
#' }
#' 
#' 
#' @name visitors_total
#' 
#' 
#' @keywords datasets
#' 
#' @examples
#' library(COVID19dashboard)
#' visitors_total
#' 
#' 
#' 
"visitors_total"