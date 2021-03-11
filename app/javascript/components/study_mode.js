// simple counter that is incremented only when the user selects a tick (correct answer)
const scoreCounter = () => {
  let counter = document.getElementById('score_count');
  let dataCount =  Number.parseInt(counter.innerHTML, 10);
  counter.innerText ++;
};

// move onto next card, for the user selecting a tick, it then changes the dataset value
// and call two functions, one being to move onto the next question and the other being to increment the score counter
const userCorrect = (event) => {
  const card = document.getElementById(`card${event.currentTarget.dataset.id}`);
  const button = event.target;
  const allHiddenField = document.querySelectorAll('.hidden_field');
  const hiddenField = Array.from(allHiddenField).filter(field => field.dataset.card === button.dataset.card);
  if (hiddenField) {
    hiddenField[0].value = true;
    const trueLink = document.getElementById(`card${event.currentTarget.dataset.id}_true`);
    trueLink.click();
  };
  scoreCounter();
  showNextCard(card);
};

// move onto next  card, for the user selecting incorrect, it changes the dataset value
// this value is then sent to a controller action which stores the value
// also moves onto the next card
const userIncorrect = (event) => {
  const card = document.getElementById(`card${event.currentTarget.dataset.id}`);
  const button = event.target;
  const allHiddenField = document.querySelectorAll('.hidden_field');
  const hiddenField = Array.from(allHiddenField).filter(field => field.dataset.card === button.dataset.card);
  if (hiddenField) {
    hiddenField[0].value = false;
    const falseLink = document.getElementById(`card${event.currentTarget.dataset.id}_false`);
    falseLink.click();
  };
  showNextCard(card);
};

// listen for click of tick or cross (will link to card_scores table)
const scoreIncrement = () => {
  const correct = document.querySelectorAll("#correct");
  const incorrect = document.querySelectorAll("#incorrect");
  correct.forEach(correctButton => {
    correctButton.addEventListener("click", (userCorrect));
  });
  incorrect.forEach(incorrectButton => {
    incorrectButton.addEventListener("click", (userIncorrect));
  });
};

// comparison and embolden of words in user guess and correct answer
// takes in the user's guess and the current id (index) of the card
// using regex it removes certain characters, and compares the correct answer and users guess
// finally it then emboldens and turns green the words in the users guess that are matched
const compareWords = (guess, id) => {
  const correctAnswer = document.getElementById(`card-answer-${id}`).innerHTML;
  let answerSplitArray = correctAnswer.split(/\b/);
  answerSplitArray = answerSplitArray.map(word => { return word.replace(/\s+/g, '').toLowerCase(); });
  guess = guess.split(/\b/).map((word) => {
    return answerSplitArray.indexOf(word.toLowerCase()) >= 0 ? '<strong class="green-text">'+word+'</strong>' : word;
  }).join(' ');
  return guess;
};

// this function captures the user inputted attempt (guess) at a question
// it then selects the relevant div to place this inputted answer
// finally it transfers to the check function to turn correct matches green
const displayAttempt = (id) => {
  const guess = document.querySelector(`.attempt_${id}`).value;
  const cardAttempt = document.querySelector(`.card-attempt${id}`);
  let currentId = id;
  let newGuess = compareWords(guess, currentId);
  cardAttempt.innerHTML = `${newGuess}`;
};

// hide current question/answer pair and dispaly next
const showNextCard = (card) => {
  card.nextElementSibling.classList.remove('flipCard');
  card.nextElementSibling.classList.remove('hideCard');
  card.classList.add('hideCard');
};

// toggle the visibility of a div question/answer, this hides the question card and shows the answer card
const toggleVisible = (id) => {
  document.getElementById(`attempt${id}`).classList.toggle("hideCard");
  document.getElementById(`answer${id}`).classList.toggle("hideCard");
};

// toggle css class to flip the card, this find the id of the relevant div (based of off the index in the card show view)
// it then toggles the classes so that the card with flip over
const flipCard = (event) => {
  const id = event.currentTarget.dataset.id;
  const card = document.getElementById(`card${id}`);
  card.classList.toggle("flipCard");
  toggleVisible(id);
  displayAttempt(id);
};

// listen for click of flip button, which is the button that flips the card over
const bindFlip = () => {
  const flipButton = document.querySelectorAll('.flipButton');
  flipButton.forEach(button => {
    button.addEventListener("click", (flipCard));
  });
};

export { bindFlip, scoreIncrement }
