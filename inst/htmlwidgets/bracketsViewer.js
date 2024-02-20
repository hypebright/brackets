HTMLWidgets.widget({
  name: "bracketsViewer",

  type: "output",

  factory: function(el, width, height) {
    var scale = 1;

    return {
      renderValue: function(opts) {
        const elementId = el.id + "-brackets-viewer";

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
            console.log(scale);
            document.getElementById(elementId).style.transform = `scale(${scale})`;
          });

        document.getElementById(elementId + "-zoom-out").addEventListener("click", function() {
            scale -= 0.1;
            console.log(scale);
            document.getElementById(elementId).style.transform = `scale(${scale})`;
          });
      },

      resize: function(width, height) {}
      
    };
  }
});

