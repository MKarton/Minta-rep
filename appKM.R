library(shiny)

ui <- fluidPage(
  h6("mintaszöveg")
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)