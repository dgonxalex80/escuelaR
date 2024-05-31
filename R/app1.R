library(shiny)

# Definir la interfaz de usuario
ui <- fluidPage(
  titlePanel("Mi primera aplicación Shiny"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("num", "Elige un número:", 
                  min = 1, max = 100, value = 50)
    ),
    mainPanel(
      textOutput("result")
    )
  )
)

# Definir la lógica del servidor
server <- function(input, output) {
  output$result <- renderText({
    paste("El número elegido es:", input$num)
  })
}

# Correr la aplicación Shiny
shinyApp(ui = ui, server = server)