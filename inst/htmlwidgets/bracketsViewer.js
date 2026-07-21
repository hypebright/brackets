// Writes theme (a named list of camelCase CSS variables from R, e.g.
// winColor) as a scoped <style> block overriding brackets-viewer.js's
// --kebab-case custom properties for the widget instance identified by
// elementId. Removes the block when no theme is set, so it can also be used
// to clear a previously applied theme. Declared at top level (rather than
// inside the widget factory below) so updateBracketsViewer's Shiny message
// handler (brackets-viewer-update.js) can call it too.
function applyTheme(elementId, theme) {
  const styleTag = document.getElementById(elementId + "-theme");

  if (!theme || Object.keys(theme).length === 0) {
    if (styleTag) styleTag.remove();
    return;
  }

  const properties = Object.keys(theme)
    .map(function(key) {
      const cssVar = key.replace(/([a-z0-9])([A-Z])/g, "$1-$2").toLowerCase();
      return "--" + cssVar + ": " + theme[key] + ";";
    })
    .join(" ");

  const tag = styleTag || document.createElement("style");
  tag.id = elementId + "-theme";
  tag.textContent = "#" + elementId + " { " + properties + " }";
  if (!styleTag) document.head.appendChild(tag);
}

// Splits `css` into its top-level @import statements and everything else.
// A plain /@import[^;]+;/ regex stops at the first semicolon, but a Google
// Fonts URL like ...family=Manrope:wght@500;700;800... has semicolons of
// its own inside the quoted string, well before the one that actually ends
// the statement. This scans character by character instead, so a semicolon
// only ends the @import once it's outside any quotes and outside url(...).
function extractImports(css) {
  const imports = [];
  let rest = "";
  let i = 0;

  while (i < css.length) {
    const start = css.indexOf("@import", i);
    if (start === -1) {
      rest += css.slice(i);
      break;
    }
    rest += css.slice(i, start);

    let end = start;
    let quote = null;
    let parenDepth = 0;
    while (end < css.length) {
      const char = css[end];
      if (quote) {
        if (char === quote) quote = null;
      } else if (char === '"' || char === "'") {
        quote = char;
      } else if (char === "(") {
        parenDepth++;
      } else if (char === ")") {
        parenDepth--;
      } else if (char === ";" && parenDepth === 0) {
        break;
      }
      end++;
    }
    end = Math.min(end + 1, css.length); // include the terminating ";", if any

    imports.push(css.slice(start, end));
    i = end;
  }

  return { imports: imports, rest: rest };
}

// Writes opts.customCSS (a raw CSS string from R, either typed directly or
// read from a .css/.scss file) as its own <style> block, scoped to this
// widget's outer container (containerId), and appended after the theme
// block so it loads last and can override anything theme doesn't cover.
// The container, rather than the inner .brackets-viewer div, is used as the
// scope root so the zoom buttons (siblings of .brackets-viewer, not
// descendants of it) are covered too. Scoping matters because, unlike
// theme's CSS variables (which only reach descendants of the element they're
// set on through normal inheritance), a plain selector like .opponents or h3
// would otherwise match every bracketsViewer() on the page, not just this
// one.
function applyCustomCSS(containerId, css) {
  const styleTag = document.getElementById(containerId + "-custom-css");

  if (!css) {
    if (styleTag) styleTag.remove();
    return;
  }

  // @import has to come before any other rule in a stylesheet, so it can't
  // live inside @scope; pull it out and keep it at the top level instead.
  const extracted = extractImports(css);
  const imports = extracted.imports;
  const rest = extracted.rest;

  const tag = styleTag || document.createElement("style");
  tag.id = containerId + "-custom-css";
  tag.textContent = imports.join("\n") + "\n@scope (#" + containerId + ") {\n" + rest + "\n}";
  if (!styleTag) document.head.appendChild(tag);
}

HTMLWidgets.widget({
  name: "bracketsViewer",

  type: "output",

  factory: function(el, width, height) {
    var scale = 1;
    const elementId = el.id + "-brackets-viewer";

    return {
      renderValue: function(opts) {

        applyTheme(elementId, opts.theme);
        applyCustomCSS(el.id, opts.customCSS);

        window.bracketsViewer.setParticipantImages(opts.participantImages || []);

        window.bracketsViewer.render(
          {
            stages: opts.data.stage,
            matches: opts.data.match,
            matchGames: opts.data.match_game,
            participants: opts.data.participant
          },
          {
            selector: "#" + elementId,
            onMatchClick: function(match) {
              if (HTMLWidgets.shinyMode) {
                Shiny.setInputValue(el.id + "_match_click", match.id);
              }
            },
            clear: true
          }
        );
        
        // change width of elements with class .round
        document.querySelectorAll("#" + elementId + " .round").forEach(function(round) {
          round.style.width = opts.roundWidth + "px";

          // also set width of any .match and h3 elements within this round
          round.querySelectorAll(".match").forEach(function(match) {
            match.style.width = opts.roundWidth + "px";
          });

          round.querySelectorAll("h3").forEach(function(h3) {
            h3.style.width = opts.roundWidth + "px";
          });
        });

        // the consolation ("third place") match brackets-viewer.js renders
        // for single/double elimination stages isn't wrapped in a .round
        // article the way every other match is - it sits directly under
        // .rounds - so the loop above never reaches it. Catch it here via
        // the direct-child combinator, which only matches that case (every
        // other match's .rounds > .round > .match is one level deeper).
        document.querySelectorAll("#" + elementId + " .rounds > .match").forEach(function(match) {
          match.style.width = opts.roundWidth + "px";
        });

        //add event listeners on click for elementId + -zoom-in and elementId + -zoom-out
        document.getElementById(elementId + "-zoom-in").addEventListener("click", function() {
            scale += 0.1;
            document.getElementById(elementId).style.transform = `scale(${scale})`;
            document.getElementById(elementId).style.width = width /scale + "px";
          });

        document.getElementById(elementId + "-zoom-out").addEventListener("click", function() {
            scale -= 0.1;
            document.getElementById(elementId).style.transform = `scale(${scale})`;
            document.getElementById(elementId).style.width = width / scale + "px";
          });
      },

      resize: function(width, height) {
        // get scale
        if (document.getElementById(elementId).style.transform === "") {
          scale = 1;
        } else {
          scale = document.getElementById(elementId).style.transform.split("(")[1].split(")")[0];
          scale = parseFloat(scale);
        }
        document.getElementById(elementId).style.width = width / scale + "px";
      }
      
    };
  }
});

