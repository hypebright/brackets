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

HTMLWidgets.widget({
  name: "bracketsViewer",

  type: "output",

  factory: function(el, width, height) {
    var scale = 1;
    const elementId = el.id + "-brackets-viewer";

    return {
      renderValue: function(opts) {

        applyTheme(elementId, opts.theme);

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

