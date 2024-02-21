HTMLWidgets.widget({
  name: "bracketsViewer",

  type: "output",

  factory: function(el, width, height) {
    var scale = 1;
    const elementId = el.id + "-brackets-viewer";

    return {
      renderValue: function(opts) {

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

