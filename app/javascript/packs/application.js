// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "canvas-confetti"


Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
import { initCardListener } from "../channels/card_listner";
import { bindFlip, scoreIncrement } from '../components/study_mode';
import { initSelect2 } from '../components/init_select2';
import confetti from "canvas-confetti"

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  if (document.getElementById('card-study-page')) {
    bindFlip();
    scoreIncrement();
  };
  if (document.getElementById('hidden_button_edit')) {
    initCardListener();
  };
  if (! document.getElementById('deck-index-search-page')) {
      initSelect2();
  };
const bigPercent = document.querySelector(".big-percent");
  if (bigPercent && bigPercent.dataset.confetti ){


var duration = 1000 * 1.5;
var end = Date.now() + duration;

(function frame() {
  // launch a few confetti from the left edge
  confetti({
    particleCount: 6,
    angle: 50,
    spread: 80,
    origin: { x: 0 , y:1}

  });
  // and launch a few from the right edge
  confetti({
    particleCount: 6,
    angle: 130,
    spread: 80,
    origin: { x: 1 , y:1},
  });

  // keep going until we are out of time
  if (Date.now() < end) {
    requestAnimationFrame(frame);
  }


}());
};

// var myCanvas = document.createElement('canvas');
// document.getElementById("results-container").appendChild(myCanvas);

// var myConfetti = confetti.create(myCanvas, {
//   resize: true,
//   useWorker: true
// });
// myConfetti({
//   particleCount: 100,
//   spread: 160
//   // any other options from the global
//   // confetti function
// });
});


