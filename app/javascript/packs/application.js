// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

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
import { initTyped, initTyped2 } from '../components/init_typed';

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
  if (document.getElementById('page-content')) {
    initTyped();
    initTyped2();
  };
});
