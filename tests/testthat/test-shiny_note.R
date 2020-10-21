test_that("shiny_note()", {

  note_1 <- shiny_note(
    tags$h3("Background & Purpose of this app"),
    h5("In December 2019..."),
    tags$h3("Code"),
    "Code and input data used to generate this Shiny app are available on...")
  
  note_2 <- box(width = NULL, status = "warning",
                helpText("How you can interact with those plots and what the outputs of those plots?"),
                tags$h3("Background & Purpose of this app"),
                h5("In December 2019..."),
                tags$h3("Code"),
                "Code and input data used to generate this Shiny app are available on...")
  
  expect_equal(note_1, note_2)
})
