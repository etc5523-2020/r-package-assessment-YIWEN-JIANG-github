test_that("add_comma()", {
  
  df <- add_comma(covid_raw, c("total_cases", "new_cases"))
  
  covid_data <- covid_raw
  covid_data$`total_cases` <- scales::comma(covid_data$`total_cases`, accuracy = 1)
  covid_data$`new_cases` <- scales::comma(covid_data$`new_cases`, accuracy = 1)
  
  expect_equal(
    df, covid_data
  )
  
  expect_error(add_comma(covid_raw, c(total_cases, new_cases)))
  
  expect_error(add_comma(covid_raw, "total_cases", "new_cases"))
})
