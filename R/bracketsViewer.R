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
#' @import htmlwidgets
#'
#' @export
bracketsViewer <- function(width = NULL, height = NULL, elementId = NULL) {
  
  data <- list(
    participant = list(
      list(id = 0, tournament_id = 0, name = "🇱🇻 Jelena Ostapenko"),
      list(id = 1, tournament_id = 0, name = "🇺🇸 Coco Gauff"),
      list(id = 2, tournament_id = 0, name = "🇷🇴 Sorana Cirstea"),
      list(id = 3, tournament_id = 0, name = "🇨🇿 Karolina Muchova"),
      list(id = 4, tournament_id = 0, name = "🇨🇿 Marketa Vondrousova"),
      list(id = 5, tournament_id = 0, name = "🇺🇸 Madison Keys"),
      list(id = 6, tournament_id = 0, name = "🇨🇳 Zheng Qinwen"),
      list(id = 7, tournament_id = 0, name = "🇧🇾 Aryna Sabalenka")
    ),
    stage = list(
      list(
        id = 0,
        tournament_id = 0,
        name = "US Open 2023 (Finals) 🎾",
        type = "single_elimination",
        number = 1,
        settings = list(
          size = 8,
          seedOrdering = list("natural"),
          grandFinal = "simple",
          matchesChildCount = 0
        )
      )
    ),
    round = list(
      list(id = 0, number = 1, stage_id = 0, group_id = 0),
      list(id = 1, number = 2, stage_id = 0, group_id = 0),
      list(id = 2, number = 3, stage_id = 0, group_id = 0)
    ),
    match = list(
      list(
        id = 0,
        number = 1,
        stage_id = 0,
        group_id = 0,
        round_id = 0,
        child_count = 0,
        status = 4,
        opponent1 = list(id = 0, position = 20, score = 0, result = "loss"),
        opponent2 = list(id = 1, position = 6, score = 2, result = "win")
      ),
      list(
        id = 1,
        number = 2,
        stage_id = 0,
        group_id = 0,
        round_id = 0,
        child_count = 0,
        status = 3,
        opponent1 = list(id = 2, position = 30, score = 0, result = "loss"),
        opponent2 = list(id = 3, position = 10, score = 2, result = "win")
      ),
      list(
        id = 2,
        number = 3,
        stage_id = 0,
        group_id = 0,
        round_id = 0,
        child_count = 0,
        status = 0,
        opponent1 = list(id = 4, position = 9, score = 0, result = "loss"),
        opponent2 = list(id = 5, position = 17, score = 2, result = "win")
      ),
      list(
        id = 3,
        number = 4,
        stage_id = 0,
        group_id = 0,
        round_id = 0,
        child_count = 0,
        status = 2,
        opponent1 = list(id = 6, position = 23, score = 0, result = "loss"),
        opponent2 = list(id = 7, position = 2, score = 2, result = "win")
      ),
      list(
        id = 4,
        number = 1,
        stage_id = 0,
        group_id = 0,
        round_id = 1,
        child_count = 0,
        status = 3,
        opponent1 = list(id = 1, score = 2, result = "win"),
        opponent2 = list(id = 3, score = 0, result = "loss")
      ),
      list(
        id = 5,
        number = 2,
        stage_id = 0,
        group_id = 0,
        round_id = 1,
        child_count = 0,
        status = 1,
        opponent1 = list(id = 5, score = 1, result = "loss"),
        opponent2 = list(id = 7, score = 2, result = "win")
      ),
      list(
        id = 6,
        number = 1,
        stage_id = 0,
        group_id = 0,
        round_id = 2,
        child_count = 0,
        status = 0,
        opponent1 = list(id = 1, score = 2, result = "win"),
        opponent2 = list(id = 7, score = 1, result = "loss")
      )
    ),
    match_game = list()
  )

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
    elementId = elementId
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
bracketsViewerOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'bracketsViewer', width, height, package = 'brackets')
}

#' @rdname bracketsViewer-shiny
#' @export
renderBracketsViewer <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, bracketsViewerOutput, env, quoted = TRUE)
}
