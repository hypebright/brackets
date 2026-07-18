# Built-in colour presets for bracketsViewer(). Names are camelCase versions
# of the CSS custom properties brackets-viewer.js exposes (winColor becomes
# --win-color), so they can be merged with user-supplied overrides.
#
# "default" (no overrides) is kept distinct from resolve_theme(NULL): NULL
# means "leave the theme untouched" in updateBracketsViewer(), while
# "default" explicitly resets to the library's built-in look.
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

#' Resolve a theme argument into a named list of CSS variable overrides
#' @noRd
resolve_theme <- function(theme) {
  if (is.null(theme)) {
    return(NULL)
  }

  if (is.character(theme)) {
    if (!theme %in% names(bracket_themes)) {
      stop(
        "Unknown theme '",
        theme,
        "'. Available built-in themes: ",
        paste(names(bracket_themes), collapse = ", "),
        ". You can also pass a named list of CSS variable overrides.",
        call. = FALSE
      )
    }
    return(bracket_themes[[theme]])
  }

  theme
}
