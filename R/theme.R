# Built-in colour presets for bracketsViewer(). Names are camelCase versions
# of the CSS custom properties brackets-viewer.js exposes (winColor becomes
# --win-color), so they can be merged with user-supplied overrides.
#
# "default" (no overrides) is kept distinct from resolve_theme(NULL): NULL
# means "leave the theme untouched" in updateBracketsViewer(), while
# "default" explicitly resets to brackets-viewer.js's own built-in look.
bracket_themes <- list(
  default = list(),
  dark = list(
    primaryBackground = "#1e1e1e",
    secondaryBackground = "#2a2a2a",
    matchBackground = "#1e1e1e",
    fontColor = "#f5f5f5",
    winColor = "#4caf50",
    lossColor = "#ef5350",
    labelColor = "#bdbdbd",
    hintColor = "#9e9e9e",
    connectorColor = "#757575",
    borderColor = "#424242",
    borderHoverColor = "#616161",
    borderSelectedColor = "#ffffff"
  )
)

#' Get a built-in theme's CSS variable overrides
#'
#' Returns the named list of CSS variable overrides behind one of
#' \code{bracketsViewer()}'s built-in \code{theme} presets. Useful for
#' building your own theme on top of a preset, since the \code{theme}
#' argument itself only accepts one preset name *or* one list of overrides,
#' not both at once: combine them yourself with \code{\link{modifyList}}, e.g.
#' \code{modifyList(bracket_theme("dark"), list(participantImageSize = "2em"))}.
#'
#' @param name Name of a built-in theme (\code{"default"} or \code{"dark"}).
#'
#' @export
bracket_theme <- function(name) {
  if (!name %in% names(bracket_themes)) {
    stop(
      "Unknown theme '",
      name,
      "'. Available built-in themes: ",
      paste(names(bracket_themes), collapse = ", "),
      call. = FALSE
    )
  }
  bracket_themes[[name]]
}

#' Resolve a theme argument into a named list of CSS variable overrides
#' @noRd
resolve_theme <- function(theme) {
  if (is.null(theme)) {
    return(NULL)
  }

  if (is.character(theme)) {
    return(bracket_theme(theme))
  }

  theme
}
