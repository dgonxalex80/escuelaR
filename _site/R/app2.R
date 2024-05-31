library(shiny)

# Interfaz de Usuario
ui <- fluidPage(
  titlePanel("Ejemplo de Todos los Botones de Shiny"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("slider", "Slider Input:", min = 1, max = 100, value = 50),
      textInput("text", "Text Input:", value = "Escribe algo"),
      numericInput("numeric", "Numeric Input:", value = 10, min = 1, max = 100),
      selectInput("select", "Select Input:", choices = c("Opción 1", "Opción 2", "Opción 3")),
      checkboxInput("checkbox", "Checkbox Input:", value = FALSE),
      radioButtons("radio", "Radio Buttons:", choices = c("Opción A", "Opción B", "Opción C")),
      actionButton("action", "Action Button"),
      br(),
      br(),
      dataTableOutput("table")
    ),
    mainPanel(
      textOutput("textOutput"),
      verbatimTextOutput("verbatimTextOutput"),
      plotOutput("plotOutput"),
      tableOutput("tableOutput")
    )
  )
)

# Lógica del Servidor
server <- function(input, output, session) {
  # Texto reactivo
  output$textOutput <- renderText({
    paste("Text Input:", input$text)
  })
  
  # Texto verbatim reactivo
  output$verbatimTextOutput <- renderPrint({
    list(
      Slider = input$slider,
      Numeric = input$numeric,
      Select = input$select,
      Checkbox = input$checkbox,
      Radio = input$radio,
      Action = input$action
    )
  })
  
  # Gráfico reactivo
  output$plotOutput <- renderPlot({
    plot(1:input$slider, main = paste("Plot con Slider hasta:", input$slider))
  })
  
  # Tabla reactiva
  output$tableOutput <- renderTable({
    data.frame(
      Parámetro = c("Slider", "Text", "Numeric", "Select", "Checkbox", "Radio"),
      Valor = c(input$slider, input$text, input$numeric, input$select, input$checkbox, input$radio)
    )
  })
  
  # Tabla interactiva reactiva
  output$table <- renderDataTable({
    data.frame(
      Parámetro = c("Slider", "Text", "Numeric", "Select", "Checkbox", "Radio", "Action"),
      Valor = c(input$slider, input$text, input$numeric, input$select, input$checkbox, input$radio, input$action)
    )
  })
  
  # Acción del botón
  observeEvent(input$action, {
    showModal(modalDialog(
      title = "Acción del Botón",
      paste("El botón fue presionado. Valor actual del slider:", input$slider)
    ))
  })
}

# Ejecutar la aplicación
shinyApp(ui = ui, server = server)
