const flipButton = document.querySelectorAll('.flipButton');
const correct = document.querySelectorAll("#correct");
const incorrect = document.querySelectorAll("#incorrect");

// move onto next card
const userCorrect = (event) => {
  const card = document.getElementById(`card${event.currentTarget.dataset.id}`);
  showNextCard(card);
};

// move onto next  card
const userIncorrect = (event) => {
  const card = document.getElementById(`card${event.currentTarget.dataset.id}`);
  showNextCard(card);
};

// listen for click of tick or cross (will link to card_scores table in time)
const scoreIncrement = () => {
  correct.forEach(correctButton => {
    correctButton.addEventListener("click", (userCorrect));
  });
  incorrect.forEach(incorrectButton => {
    incorrectButton.addEventListener("click", (userIncorrect));
  });
};

// increment the form input value for your attempt
const displayAttempt = (id) => {
  const guess = document.querySelector(`.attempt_${id}`);
  const cardAttempt = document.querySelector(`.card-attempt${id}`);
  cardAttempt.innerText = `Your Answer:\n\n ${guess.value}`;
};

// hide current question/answer pair and dispaly next
const showNextCard = (card) => {
  card.nextElementSibling.classList.remove('flipCard');
  card.nextElementSibling.classList.remove('hideCard');
  card.classList.add('hideCard');
};

// toggle the visibility of a div question/answer
const toggleVisible = (id) => {
  document.getElementById(`attempt${id}`).classList.toggle("hideCard");
  document.getElementById(`answer${id}`).classList.toggle("hideCard");
};

// toggle css class to flip the card
const flipCard = (event) => {
  const id = event.currentTarget.dataset.id;
  const card = document.getElementById(`card${id}`);
  card.classList.toggle("flipCard");
  toggleVisible(id);
  displayAttempt(id);
};

// listen for click of flip button
const bindFlip = () => {
  flipButton.forEach(button => {
    button.addEventListener("click", (flipCard));
  });
};

export { bindFlip, scoreIncrement }