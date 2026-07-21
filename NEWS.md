# brackets 0.2.0

## New features

* Participants can now show an image (logo, flag, photo) via an optional
  `image` field, displayed next to their name.
* `bracketsViewer()` gains a `theme` argument: use a built-in preset
  (`"default"` or `"dark"`), or a named list of CSS variable overrides.
  `bracket_theme()` returns a built-in preset's overrides so you can build on
  top of one with `modifyList()`.
* `updateBracketsViewer()` can now update the `theme` at runtime, so a
  light/dark toggle can restyle a bracket that's already on screen without
  redrawing it.
* `bracketsViewer()` gains a `customCSS` argument for styling beyond `theme`:
  a raw CSS string, or a path to a `.css`/`.scss` file (compiled with
  {sass}), scoped to that widget only.
* New vignette, `vignette("advanced-styling", package = "brackets")`, walking
  through theming and custom CSS end to end.
* New example app: a full FIFA World Cup 2026 bracket (group stage and
  knockout stage, with a phase selector), in `inst/examples/world-cup/`. The
  original tennis/soccer example moved into its own folder,
  `inst/examples/tennis-soccer/`, alongside it.

## Bug fixes

* The widget container now only shows scrollbars when its content actually
  overflows, instead of always reserving scrollbar space.
* `roundWidth` is now correctly applied to the consolation (third-place)
  match, which previously ignored it and kept its default width.
