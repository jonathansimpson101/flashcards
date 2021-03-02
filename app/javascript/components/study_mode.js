const card = document.getElementById('card');
const attempt = document.querySelector('.attempt-side');
const answer = document.querySelector('.answer-side');
const flipButton = document.getElementById('flipButton');
const cardAttempt = document.querySelector('.card-attempt');
const correct = document.getElementById("correct");
const incorrect = document.getElementById("incorrect");

const testPrint = () => {
  console.log('test');
};

const scoreIncrement = () => {
  correct.addEventListener("click", (testPrint));
  // let incor = incorrect.addEventListener("click", (testPrint));
};

const displayAttempt = (guess) => {
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
  let guess = document.querySelector('attempt_1');
  toggleVisible();
  debugger
  displayAttempt(guess);
};

const bindFlip = () => {
  flipButton.addEventListener("click", (flipCard));
};

export { bindFlip, scoreIncrement }
