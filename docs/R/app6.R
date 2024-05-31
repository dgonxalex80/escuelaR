library(shiny)
ui <- function() {
  fluidPage(
    # Define a first sliderInput(), 
    # with an id that we will postfix with `1`
    # in order to make it unique
    sliderInput(
      inputId = "choice1", 
      label = "choice 1", 
      min = 1, max = 10, value = 5
    ),
    # Define a first actionButton(), 
    # with an id that we will postfix with `1`
    # in order to make it unique
    actionButton(
      inputId = "validate1",
      label = "Validate choice 1"
    ),
    # We define here a second sliderInput, 
    # and need its id to be unique, so we 
    # postfix it with 2
    sliderInput(
      inputId = "choice2",
      label = "choice 2", 
      min = 1, max = 10, value = 5
    ),
    # We define here a second actionButton, 
    # and need its id to be unique, so we 
    # postfix it with 2
    actionButton(
      inputId = "validate2", 
      label = "Validate choice 2"
    )
  )
}

server <- function(input, output, session) {
  
  # Observing the first series of inputs
  # Whenever the user clicks on the first validate button, 
  # the value of choice1 will be printed to the console
  observeEvent( input$validate1 , {
    print(input$choice1)
  })
  
  # Same as the first observeEvent, except that we are 
  # observing the second series
  observeEvent( input$validate2 , {
    print(input$choice2)
  })
}

shinyApp(ui, server)