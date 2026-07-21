library(shiny)
library(bslib)
library(brackets)

source("global.R", local = TRUE)

ui <- fluidPage(
  theme = bs_theme(
    bg = "#05130c",
    fg = "#f4efe1",
    primary = "#1fd694",
    base_font = font_google("Manrope"),
    heading_font = font_google("Anton")
  ) |>
    bs_add_rules(sass::sass_file("www/app-styling.scss")),
  div(
    class = "wc-shell",
    div(
      class = "wc-header",
      div(class = "wc-kicker", "Built with {brackets}"),
      tags$h1(class = "wc-title", "FIFA World Cup ", tags$span("2026")),
      div(
        class = "wc-subtitle",
        "Bracket explorer: every group & knockout round"
      )
    ),
    div(
      class = "wc-controls",
      div(
        class = "wc-phase-select",
        selectInput(
          "phase",
          label = "Tournament phase",
          choices = c("Knockout Stage", "Group Stage"),
          selected = "Knockout Stage",
          width = "260px"
        )
      )
    ),
    div(
      class = "wc-panel",
      bracketsViewerOutput("world_cup", height = "auto")
    )
  )
)

server <- function(input, output) {
  output$world_cup <- renderBracketsViewer({
    data <- if (input$phase == "Knockout Stage") {
      worldcup_knockout
    } else {
      worldcup_groups
    }

    bracketsViewer(
      data,
      roundWidth = 200,
      theme = worldcup_theme,
      customCSS = worldcup_css
    )
  })
}

shinyApp(ui, server)
