# Minimum viable example of a shiny app with a grid layout

library(shiny)

# Define UI
ui <- fluidPage(
  # Grid Layout
  fluidRow(wellPanel("Top row")),
  fluidRow(column(width = 2, wellPanel("Bottom row, column 1, width 4")),
           column(width = 2, wellPanel("Bottom row, column 2, width 4")),
           column(width = 2, wellPanel("Bottom row, column 3, width 4"))))


# Server function
server <- function(input, output) {
  
}

# Run the application
shinyApp(ui = ui, server = server)