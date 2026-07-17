function updateParticipant(participantEl, opponent) {
  if (!participantEl) return;

  const nameEl = participantEl.getElementsByClassName("name")[0];

  if (opponent?.id != null) {
    participantEl.setAttribute("data-participant-id", opponent.id.toString());

    const participant = bracketsViewer.participants.find(p => p.id === opponent.id);
    if (participant) {
      participantEl.setAttribute("title", participant.name);
      nameEl.innerHTML = participant.name;
      bracketsViewer.renderParticipantImage(nameEl, participant.id);
    }
  } else {
    participantEl.setAttribute("data-participant-id", "");
    participantEl.setAttribute("title", "");
    nameEl.innerHTML = "";
  }

  if (opponent?.result === "win") {
    participantEl.classList.add("win");
    participantEl.classList.remove("loss");
  } else if (opponent?.result === "loss") {
    participantEl.classList.add("loss");
    participantEl.classList.remove("win");
  } else {
    participantEl.classList.remove("win");
    participantEl.classList.remove("loss");
  }

  const resultEl = participantEl.querySelector(".result");
  if (resultEl) {
    resultEl.innerHTML = opponent?.score ? opponent.score.toString() : "-";
  }
}

function updateMatch(elementId, match) {
  const elementContainer = document.getElementById(elementId);
  if (!elementContainer) throw Error("Element not found.");

  // find match id in elementContainer
  elementContainer.querySelectorAll(".match").forEach(element => {
    if (element.getAttribute("data-match-id") === match.id.toString()) {
      updateParticipant(element.querySelector(".participant:nth-of-type(1)"), match.opponent1);
      updateParticipant(element.querySelector(".participant:nth-of-type(2)"), match.opponent2);
    }
  });
}

// add Shiny custom message handler
if(HTMLWidgets.shinyMode) {
    Shiny.addCustomMessageHandler("updateBracketsViewer", function(message) {
    updateMatch(message.id + "-brackets-viewer", message.data);
  });
}
