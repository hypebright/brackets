HTMLWidgets.widget({

  name: 'bracketsViewer',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {
        
        el.innerHTML = '<div id="bracketsViewerExample" class="brackets-viewer"></div>'

        const data = {
          participant: [
            {
              id: 0,
              tournament_id: 0,
              name: "🇱🇻 Jelena Ostapenko"
            },
            {
              id: 1,
              tournament_id: 0,
              name: "🇺🇸 Coco Gauff"
            },
            {
              id: 2,
              tournament_id: 0,
              name: "🇷🇴 Sorana Cirstea"
            },
            {
              id: 3,
              tournament_id: 0,
              name: "🇨🇿 Karolina Muchova"
            },
            {
              id: 4,
              tournament_id: 0,
              name: "🇨🇿 Marketa Vondrousova"
            },
            {
              id: 5,
              tournament_id: 0,
              name: "🇺🇸 Madison Keys"
            },
            {
              id: 6,
              tournament_id: 0,
              name: "🇨🇳 Zheng Qinwen"
            },
            {
              id: 7,
              tournament_id: 0,
              name: "🇧🇾 Aryna Sabalenka"
            }
          ],
          stage: [
            {
              id: 0,
              tournament_id: 0,
              name: "US Open 2023 (Finals) 🎾",
              type: "single_elimination",
              number: 1,
              settings: {
                size: 8,
                seedOrdering: [
                  "natural"
                ],
                grandFinal: "simple",
                matchesChildCount: 0
              }
            }
          ],
          round: [
            {
              id: 0,
              number: 1,
              stage_id: 0,
              group_id: 0
            },
            {
              id: 1,
              number: 2,
              stage_id: 0,
              group_id: 0
            },
            {
              id: 2,
              number: 3,
              stage_id: 0,
              group_id: 0
            }
          ],
          match: [
            {
              id: 0,
              number: 1,
              stage_id: 0,
              group_id: 0,
              round_id: 0,
              child_count: 0,
              status: 4,
              opponent1: {
                id: 0,
                position: 20,
                score: 0,
                result: "loss"
              },
              opponent2: {
                id: 1,
                position: 6,
                score: 2,
                result: "win"
              }
            },
            {
              id: 1,
              number: 2,
              stage_id: 0,
              group_id: 0,
              round_id: 0,
              child_count: 0,
              status: 3,
              opponent1: {
                id: 2,
                position: 30,
                score: 0,
                result: "loss"
              },
              opponent2: {
                id: 3,
                position: 10,
                score: 2,
                result: "win"
              }
            },
            {
              id: 2,
              number: 3,
              stage_id: 0,
              group_id: 0,
              round_id: 0,
              child_count: 0,
              status: 0,
              opponent1: {
                id: 4,
                position: 9,
                score: 0,
                result: "loss"
              },
              opponent2: {
                id: 5,
                position: 17,
                score: 2,
                result: "win"
              }
            },
            {
              id: 3,
              number: 4,
              stage_id: 0,
              group_id: 0,
              round_id: 0,
              child_count: 0,
              status: 2,
              opponent1: {
                id: 6,
                position: 23,
                score: 0,
                result: "loss"
              },
              opponent2: {
                id: 7,
                position: 2,
                score: 2,
                result: "win"
              }
            },
            {
              id: 8,
              number: 1,
              stage_id: 0,
              group_id: 0,
              round_id: 1,
              child_count: 0,
              status: 3,
              opponent1: {
                id: 1,
                score: 2,
                result: "win"
              },
              opponent2: {
                id: 3,
                score: 0,
                result: "loss"
              }
            },
            {
              id: 9,
              number: 2,
              stage_id: 0,
              group_id: 0,
              round_id: 1,
              child_count: 0,
              status: 1,
              opponent1: {
                id: 5,
                score: 1,
                result: "loss"
              },
              opponent2: {
                id: 7,
                score: 2,
                result: "win"
              }
            },
            {
              id: 12,
              number: 1,
              stage_id: 0,
              group_id: 0,
              round_id: 2,
              child_count: 0,
              status: 0,
              opponent1: {
                id: 1,
                score: 2,
                result: "win"
              },
              opponent2: {
                id: 7,
                score: 1,
                result: "loss"
              }
            }
          ],
          match_game: []
        };

        window.bracketsViewer.render({
          stages: data.stage,
          matches: data.match,
          matchGames: data.match_game,
          participants: data.participant
        });

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});