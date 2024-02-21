function updateMatch(elementId, match) {
  const elementContainer = document.getElementById(elementId);
  if (!elementContainer) throw Error("Element not found.");

  // find match id in elementContainer
  elementContainer.querySelectorAll(".match").forEach(element => {
    if (element.getAttribute("data-match-id") === match.id.toString()) {
      
      const participant1 = element.querySelector(".participant:nth-of-type(1)");
      if (participant1) {
        // set data-participant-id
        if (match.opponent1?.id) {
          participant1.setAttribute("data-participant-id", match.opponent1?.id?.toString());
          // find name beloning to id
          bracketsViewer.participants.forEach(participant => {
            if (participant.id === match.opponent1?.id) {
              participant1.setAttribute("title", participant.name);
              participant1.getElementsByClassName("name")[0].innerHTML = participant.name;
            }
          });
        } else {
          participant1.setAttribute("data-participant-id", "");
          participant1.setAttribute("title", "");
          participant1.getElementsByClassName("name")[0].innerHTML = "";
        }    

        // set win/loss
        if (match.opponent1?.result === "win") {
          participant1.classList.add("win");
          participant1.classList.remove("loss");
        } else if (match.opponent1?.result === "loss") {
          participant1.classList.add("loss");
          participant1.classList.remove("win");
        } else {
          participant1.classList.remove("win");
          participant1.classList.remove("loss");
        }
      }
      
      const participant2 = element.querySelector(".participant:nth-of-type(2)");
      if (participant2) {
        if (match.opponent2?.id) {
          participant2.setAttribute("data-participant-id", match.opponent2?.id?.toString());
          // find name beloning to id
          bracketsViewer.participants.forEach(participant => {
            if (participant.id === match.opponent2?.id) {
              participant2.setAttribute("title", participant.name);
              participant2.getElementsByClassName("name")[0].innerHTML = participant.name;
            }
          });
        } else {
          participant2.setAttribute("data-participant-id", "");
          participant2.setAttribute("title", "");
          participant2.getElementsByClassName("name")[0].innerHTML = "";
        }
        // set win/loss
        if (match.opponent2?.result === "win") {
          participant2.classList.add("win");
          participant2.classList.remove("loss");
        } else if (match.opponent2?.result === "loss") {
          participant2.classList.add("loss");
          participant2.classList.remove("win");
        } else {
          participant2.classList.remove("win");
          participant2.classList.remove("loss");
        }
      }
      
      const result1 = element.querySelector(".participant:nth-of-type(1) .result");
      if (result1) {
        if (match.opponent1?.score) {
          result1.innerHTML = match.opponent1?.score?.toString();
        } else {
          result1.innerHTML = "-";
        }
      }

      const result2 = element.querySelector(".participant:nth-of-type(2) .result");
      if (result2) {
        if (match.opponent2?.score) {
          result2.innerHTML = match.opponent2?.score?.toString();
        } else {
          result2.innerHTML = "-";
        }
      }
    }
  });
}

// add Shiny custom message handler
if(HTMLWidgets.shinyMode) {
    Shiny.addCustomMessageHandler("updateBracketsViewer", function(message) {
    updateMatch(message.id + "-brackets-viewer", message.data);
  });
}