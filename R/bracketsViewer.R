#' View tournament brackets
#'
#' Visualize tournament brackets by providing data following the brackets-model
#' schema. The data should be a list with the following fields:
#' \itemize{
#'  \item \code{participant} A list of participants, each participant should be
#'  a list with the following fields: \code{id}, \code{tournament_id},
#'  \code{name}.
#'  \item \code{stage} A list of stages, each stage should be a list with the
#'  following fields: \code{id}, \code{tournament_id}, \code{name}, \code{type},
#'  \code{number}, \code{settings}.
#'  \item \code{round} A list of rounds, each round should be a list with the
#'  following fields: \code{id}, \code{number}, \code{stage_id}, \code{group_id}.
#'  \item \code{match} A list of matches, each match should be a list with the
#'  following fields: \code{id}, \code{number}, \code{stage_id}, \code{group_id},
#'  \code{round_id}, \code{child_count}, \code{status}, \code{opponent1},
#'  \code{opponent2}.
#' }
#' 
#' @param data A list containing the tournaments brackets data, see description.
#' @import htmlwidgets
#'
#' @export
bracketsViewer <- function(data, width = NULL, height = NULL, elementId = NULL) {
  
  # forward options using x
  opts = list(
    data = data
  )
  
  # create widget
  htmlwidgets::createWidget(
    name = 'bracketsViewer',
    opts,
    width = width,
    height = height,
    package = 'brackets',
    elementId = elementId,
    sizingPolicy = htmlwidgets::sizingPolicy(
      padding = 10,
      browser.fill = TRUE
    )
  )
}

#' Shiny bindings for bracketsViewer
#'
#' Output and render functions for using bracketsViewer within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a bracketsViewer
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name bracketsViewer-shiny
#'
#' @export
bracketsViewerOutput <- function(outputId, width = '100%', height = '100%'){
  htmlwidgets::shinyWidgetOutput(outputId, 'bracketsViewer', width, height, package = 'brackets')
}

#' @rdname bracketsViewer-shiny
#' @export
renderBracketsViewer <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, bracketsViewerOutput, env, quoted = TRUE)
}

#' @keywords internal
bracketsViewer_html <- function(id, style, class, ...) {
  tags$div(
    id = id, 
    style = paste0(style, "overflow:scroll;"), 
    class = class,
    tags$div(
      style = "position: absolute; z-index: 1;",
      tags$button(id = paste0(id, "-brackets-viewer-zoom-in"), "+"),
      tags$button(id = paste0(id, "-brackets-viewer-zoom-out"), "-")
    ),
    tags$div(
      id = paste0(id, "-brackets-viewer"),
      class = "brackets-viewer",
      style = "transition: transform 0.3s ease; transform-origin: top left;"
    )
  )
}
