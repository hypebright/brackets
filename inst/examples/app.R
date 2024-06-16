library(shiny)
library(bslib)
library(brackets)

source("global.R", local = TRUE)

ui <- page_fluid(
  title = "Brackets Viewer",
  theme = bs_theme(
    primary = "#E69F00",
    secondary = "#0072B2",
    success = "#009E73",
    base_font = font_google("Barlow Condensed")
  ),
  navset_underline(
    nav_panel(title = "Tennis",
              br(),
              br(),
              actionButton("update_tennis_match", "Update Grand Final"),
              actionButton("reset_tennis_match", "Reset Grand Final"),
              br(),
              br(),
              bracketsViewerOutput("tennis"),
              br(),
              textOutput("clicked_match")
    ),
    nav_panel(title = "Soccer",
              br(),
              br(),
              bracketsViewerOutput("soccer"),
              br(),
              textOutput("clicked_match2")
    )
  )
)

server <- function(input, output, session) {
  
  output$tennis <- renderBracketsViewer({
    bracketsViewer(
      data = tennis_data,
      roundWidth = 300
    )
  })
  
  output$soccer <- renderBracketsViewer({
    bracketsViewer(
      data = soccer_data_advanced
    )
  })
  
  output$clicked_match <- renderText({
    input$tennis_match_click
  })
  
  output$clicked_match2 <- renderText({
    input$soccer_match_click
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
