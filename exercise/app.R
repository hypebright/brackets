
library(shiny)

source("global.R", local = TRUE)

ui <- fluidPage(
  titlePanel("Bracket Viewer"),
  bracketsViewerOutput("tennis"),
  bracketsViewerOutput("soccer")
)

server <- function(input, output) {
  
  output$tennis <- renderBracketsViewer({
    bracketsViewer(
      data = tennis_data
    )
  })
  
  output$soccer <- renderBracketsViewer({
    bracketsViewer(
      data = soccer_data
    )
  })
  
}

shinyApp(ui = ui, server = server)
