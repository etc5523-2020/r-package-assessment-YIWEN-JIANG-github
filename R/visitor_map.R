#' World wide the number of visitors changes since the beginning of the pandemic with location information
#'
#' The data contains the information on how visitors to (or time spent in) categorized places change compared to the baseline days. 
#' A baseline day represents a normal value for that day of the week. 
#' The baseline day is the median value from the 5‑week period Jan 3 – Feb 6, 2020.
#' And the world country polygons at a specified scale
#'
#' @source
#' Google Community Mobility Reports 
#' <https://www.google.com/covid19/mobility/>
#' 
#' 
#' @format Data frame with columns
#' \describe{
#' \item{Entity}{Name of countries or territories}
#' \item{Code}{Country code}
#' \item{Date}{Date of the information been recorded}
#' \item{category}{Categorized places}
#' \item{change}{Changes compared to our baseline days}
#' }
#' 
#' 
#' @name visitor_map
#' 
#' 
#' @keywords datasets
#' 
#' @examples
#' library(COVID19dashboard)
#' visitor_map
#' 
#' 
#' 
"visitor_map"