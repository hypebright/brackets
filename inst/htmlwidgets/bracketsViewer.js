HTMLWidgets.widget({
  name: "bracketsViewer",

  type: "output",

  factory: function(el, width, height) {
    // TODO: define shared variables for this instance

    return {
      renderValue: function(opts) {
        
        const elementId = el.id + "-brackets-viewer";
        
        el.innerHTML = '<div id="' + elementId + '" class="brackets-viewer"></div>';

        window.bracketsViewer.render(
          {
            stages: opts.data.stage,
            matches: opts.data.match,
            matchGames: opts.data.match_game,
            participants: opts.data.participant
          },
          {
            selector: "#" + elementId
          }
        );
      },

      resize: function(width, height) {
        // TODO: code to re-render the widget with a new size
      }
    };
  }
});

