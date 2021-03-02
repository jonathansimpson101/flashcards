const card = document.getElementById('card');
const attempt = document.querySelector('.attempt-side');
const answer = document.querySelector('.answer-side');
const flipButton = document.getElementById('flipButton');
const cardAttempt = document.querySelector('.card-attempt');
const correct = document.getElementById("correct");
const incorrect = document.getElementById("incorrect");

const userCorrect = () => {
  showNextCard();
};

const userIncorrect = () => {
  showNextCard();
};


const scoreIncrement = () => {
  correct.addEventListener("click", (userCorrect));
  incorrect.addEventListener("click", (userIncorrect));
};

const displayAttempt = () => {
  let index = 0
  const guess = document.querySelector(`.attempt_${index}`);
  cardAttempt.innerText = guess.value;
  index ++;
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

export { bindFlip, scoreIncrement }
