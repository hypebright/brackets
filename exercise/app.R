
library(shiny)

source("global.R", local = TRUE)

ui <- fluidPage(
  titlePanel("Bracket Viewer"),
  br(),
  actionButton("update_tennis_match", "Update Grand Final"),
  actionButton("reset_tennis_match", "Reset Grand Final"),
  br(),
  br(),
  bracketsViewerOutput("tennis"),
  br(),
  bracketsViewerOutput("soccer")
)

server <- function(input, output, session) {
  
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
  
  observe({
    print(input$tennis_match_click)
  })
  
  observe({
    
    grand_final <-     
      list(
        id = 6,
        opponent1 = list(id = 1, score = 2, result = "win"),
        opponent2 = list(id = 7, score = 1, result = "loss")
      )
    
    updateBracketsViewer(inputId = "tennis", 
                         session = session,
                         match_data = grand_final)
    
  }) |> bindEvent(input$update_tennis_match)
  
  observe({
    
    grand_final <-     
      list(
        id = 6,
        opponent1 = list(id = NA),
        opponent2 = list(id = NA)
      )
    
    updateBracketsViewer(inputId = "tennis", 
                         session = session,
                         match_data = grand_final)
    
  }) |> bindEvent(input$reset_tennis_match)
  
}

shinyApp(ui = ui, server = server)
