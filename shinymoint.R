library(shiny)
library(ggplot2)

ui <- fluidPage(
  shiny::sidebarPanel(
    h1("Sidebar"),
    shiny::sliderInput( "m", "várthaó érték", min=-10, max=10,
                        step = 1, value = 0),
    shiny::numericInput(inputId = "sd", "szórás", value =1, min = 1, max = 100),
    shiny::actionButton("new_data", "Véletelen generálás"),
    ),
  shiny::plotOutput("dplot")

)

server <- function(input, output, session) {
  output$dplot <- shiny::renderPlot({
    
    ggplot(data = data.frame(x = seq(-10, 10))) +
      aes(x = x)+
    stat_function(geom = "area", fun = dnorm,
                  args = list(mean=input$m))
  })
  observeEvent(eventExpr = input$new_data, handlerExpr = {
    data.frame(x =rnorm(1000, mean = input$m, sd = input$sd))
    
    write.csv(x=out, file = "random_number.csv")
  })
}

shinyApp(ui, server)