test_that("date_range()", {
  date_input_1 <- date_range(visitors_total, 
                             date_col = "Date",
                             "visitor_date")
  
  date_input_2 <- dateRangeInput("visitor_date", "Date Range: ",
                                 start = min(visitors_total$Date),
                                 end = max(visitors_total$Date),
                                 min = min(visitors_total$Date), 
                                 max = max(visitors_total$Date))
  
  expect_equal(date_input_1, date_input_2)
  
  expect_error(date_range(visitors_total, 
                          "visitor_date"))
  
  expect_error(date_range(visitors_total, 
                          date_col = "Date"))
})
