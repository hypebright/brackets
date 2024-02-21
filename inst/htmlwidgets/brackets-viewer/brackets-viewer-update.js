function updateMatch(elementId, match) {
  const elementContainer = document.getElementById(elementId);
  if (!elementContainer) throw Error("Element not found.");

  // find match id in elementContainer
  elementContainer.querySelectorAll(".match").forEach(element => {
    if (element.getAttribute("data-match-id") === match.id.toString()) {
      
      const result1 = element.querySelector(".participant:nth-of-type(1) .result");
      if (result1 && match.opponent1?.score) {
        result1.innerHTML = match.opponent1?.score?.toString();
      }

      const result2 = element.querySelector(".participant:nth-of-type(2) .result");
      if (result2 && match.opponent2?.score) {
        result2.innerHTML = match.opponent2?.score?.toString();
      }

      const resultClass1 = element.querySelector(".participant:nth-of-type(1)");
      if (resultClass1 && match.opponent1?.result) {
        if (match.opponent1?.result === "win") {
          resultClass1.classList.add("win");
          resultClass1.classList.remove("loss");
        } else {
          resultClass1.classList.add("loss");
          resultClass1.classList.remove("win");
        }
      }

      const resultClass2 = element.querySelector(".participant:nth-of-type(2)");
      if (resultClass2 && match.opponent2?.result) {
        if (match.opponent2?.result === "win") {
          resultClass2.classList.add("win");
          resultClass2.classList.remove("loss");
        } else {
          resultClass2.classList.add("loss");
          resultClass2.classList.remove("win");
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