HTMLWidgets.widget({

  name: 'bracketsViewer',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(opts) {
        
        el.innerHTML = '<div id="bracketsViewerExample" class="brackets-viewer"></div>'

        window.bracketsViewer.render({
          stages: opts.data.stage,
          matches: opts.data.match,
          matchGames: opts.data.match_game,
          participants: opts.data.participant
        });

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});