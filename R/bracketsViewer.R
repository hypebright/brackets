#' View tournament brackets
#'
#' Visualize tournament brackets by providing data following the brackets-model
#' schema. The data should be a list with the following fields:
#' \itemize{
#'  \item \code{participant} A list of participants, each participant should be
#'  a list with the following fields: \code{id}, \code{tournament_id},
#'  \code{name}. An optional \code{image} field (a URL) can be added to show
#'  a logo, flag or photo next to the participant's name.
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
#' @param data A list containing the tournaments brackets data, see description
#' @param roundWidth The width of the round column in pixels
#' @param theme Optional visual theme: either the name of a built-in theme
#'   (\code{"default"} or \code{"dark"}), or a named list of CSS variable overrides
#'   using camelCase names, e.g. \code{list(winColor = "#4caf50", matchWidth =
#'   "180px")}. Overridable variables: \code{primaryBackground},
#'   \code{secondaryBackground}, \code{matchBackground}, \code{fontColor},
#'   \code{winColor}, \code{lossColor}, \code{labelColor}, \code{hintColor},
#'   \code{connectorColor}, \code{borderColor}, \code{borderHoverColor},
#'   \code{borderSelectedColor}, \code{textSize}, \code{roundMargin},
#'   \code{matchWidth}, \code{matchHorizontalPadding},
#'   \code{matchVerticalPadding}, \code{connectorBorderWidth},
#'   \code{matchBorderWidth}, \code{matchBorderRadius},
#'   \code{participantImageSize}. Defaults to \code{NULL}, brackets-viewer.js's
#'   own built-in look.
#' @param customCSS Optional escape hatch for styling beyond \code{theme}:
#'   a raw CSS string, or a path to a \code{.css}/\code{.scss} file (compiled
#'   with \pkg{sass}). A file path that doesn't exist as given is also looked
#'   up under \code{www/}, so inside a Shiny app you can just name a file you
#'   already ship in its \code{www} folder, e.g. \code{customCSS =
#'   "styles.scss"}. Loaded after brackets-viewer.js's own stylesheet and
#'   after \code{theme}, so it can override anything they don't cover (fonts,
#'   hover states, the zoom buttons' appearance, image shape/size, etc.).
#'   Automatically scoped (with the CSS \code{@@scope} at-rule) to this
#'   widget, so a plain selector like \code{.opponents} or \code{h3} only
#'   affects this bracket, not other \code{bracketsViewer()}s on the same
#'   page, nor the rest of the page. This relies on browser support for
#'   \code{@@scope} (all current major browsers); in an unsupported browser
#'   \code{customCSS} is simply skipped rather than leaking.
#' @param width The width of the widget
#' @param height The height of the widget
#' @param elementId The id of the widget
#' @import htmlwidgets
#'
#' @export
bracketsViewer <- function(data, roundWidth = 150, theme = NULL, customCSS = NULL, width = NULL, height = NULL, elementId = NULL) {

  # forward options
  opts = list(
    data = data,
    roundWidth = roundWidth,
    participantImages = participant_images(data$participant),
    theme = resolve_theme(theme),
    customCSS = resolve_custom_css(customCSS)
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

#' Reshape participants with an image field into brackets-viewer.js's
#' participantId/imageUrl pairs
#' @noRd
participant_images <- function(participants) {
  with_image <- Filter(function(p) !is.null(p$image), participants)
  lapply(with_image, function(p) list(participantId = p$id, imageUrl = p$image))
}

#' @keywords internal
#' @importFrom htmltools tags
bracketsViewer_html <- function(id, style, class, ...) {
  tags$div(
    id = id,
    style = paste0(style, "overflow:auto;"),
    class = class,
    tags$div(
      style = "position: absolute; z-index: 1;",
      tags$button(
        id = paste0(id, "-brackets-viewer-zoom-in"),
        class = "brackets-viewer-zoom-btn brackets-viewer-zoom-in",
        "+"
      ),
      tags$button(
        id = paste0(id, "-brackets-viewer-zoom-out"),
        class = "brackets-viewer-zoom-btn brackets-viewer-zoom-out",
        "-"
      )
    ),
    tags$div(
      id = paste0(id, "-brackets-viewer"),
      class = "brackets-viewer",
      style = "transition: transform 0.3s ease; transform-origin: top left; margin: 0;"
    )
  )
}

#' Update bracketsViewer data and/or theme
#' @param inputId The input id that the data should be updated for
#' @param match_data Optional new match data to apply, a list containing the
#'   match data with the id. Leave as \code{NULL} to update the theme only.
#' @param theme Optional theme to switch to, using the same values accepted
#'   by the \code{theme} argument of \code{\link{bracketsViewer}}. Leave as
#'   \code{NULL} to leave the current theme untouched, or pass \code{"default"}
#'   to explicitly reset to brackets-viewer.js's own built-in look.
#' @param session The Shiny session object
#'
#' @importFrom shiny getDefaultReactiveDomain
#'
#' @export
updateBracketsViewer <- function(inputId,
                                 match_data = NULL,
                                 theme = NULL,
                                 session = shiny::getDefaultReactiveDomain()) {
  session$sendCustomMessage(
    type = "updateBracketsViewer",
    message = list(
      id = inputId,
      data = match_data,
      theme = resolve_theme(theme)
    )
  )
}
