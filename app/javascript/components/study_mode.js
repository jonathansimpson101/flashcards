const card = document.getElementById('card');
const attempt = document.querySelector('.attempt-side');
const answer = document.querySelector('.answer-side');
const flipButton = document.getElementById('flipButton');
const correct = document.getElementById("correct");
const incorrect = document.getElementById("incorrect");
const guess = document.getElementById('user_attempt');
const cardAttempt = document.querySelector('.card-attempt');

const displayAttempt = () => {
  cardAttempt.innerText = guess.value
};

const showNextCard = () => {
  card.nextElementSibling.classList.remove('hideCard');
  card.classList.add('hideCard');
};

const toggleVisible = () => {
  attempt.classList.toggle("hideCard");
  answer.classList.toggle("hideCard");
};

const flipCard = () => {
  card.classList.toggle("flipCard");
  toggleVisible();
  displayAttempt();
};

const bindFlip = () => {
  flipButton.addEventListener("click", (flipCard));
};
// correct.addEventListener("click", (console.log("+1")));
// incorrect.addEventListener("click", (console.log("-1")));

export { bindFlip }
