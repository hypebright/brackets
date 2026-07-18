# Resolves bracketsViewer()'s customCSS argument into a single CSS string.
# Callers can pass a raw CSS string, or a path to a .css/.scss file. File
# paths are also looked up relative to "www/" (unresolved) so a Shiny app can
# just name a file it already ships in its www folder, the same way it would
# reference any other www asset.
#' @noRd
resolve_custom_css <- function(customCSS) {
  if (is.null(customCSS)) {
    return(NULL)
  }

  if (!grepl("\\.(css|scss)$", customCSS)) {
    return(customCSS)
  }

  path <- if (file.exists(customCSS)) customCSS else file.path("www", customCSS)

  if (!file.exists(path)) {
    stop(
      "Can't find customCSS file '", customCSS, "' (also looked in 'www/'). ",
      "Pass an existing .css/.scss path, or a raw CSS string.",
      call. = FALSE
    )
  }

  if (grepl("\\.scss$", path)) {
    return(as.character(sass::sass(sass::sass_file(path))))
  }

  paste(readLines(path, warn = FALSE), collapse = "\n")
}
