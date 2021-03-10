const scoreCounter = () => {
  let counter = document.getElementById('score_count');
  let dataCount =  Number.parseInt(counter.innerHTML, 10);
  counter.innerText ++;
};

// move onto next card
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

// move onto next  card
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

// listen for click of tick or cross (will link to card_scores table in time)
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
const compareWords = (guess, id) => {
  const correctAnswer = document.getElementById(`card-answer-${id}`).innerHTML;
  let answerSplitArray = correctAnswer.replace(/[,\/!%\^&\*;\`~↵]/g," ").split(' ');
  console.log(answerSplitArray);
  answerSplitArray = answerSplitArray.map(word => { return word.replace(/\s+/g, '').toLowerCase(); });
  console.log(answerSplitArray);
  guess = guess.split(' ').map((word) => {
    return answerSplitArray.indexOf(word.toLowerCase()) >= 0 ? '<strong class="green-text">'+word+'</strong>' : word;
  }).join(' ');
  console.log(guess);
  return guess;
};

// increment the form input value for your attempt
const displayAttempt = (id) => {
  const guess = document.querySelector(`.attempt_${id}`).value;
  const cardAttempt = document.querySelector(`.card-attempt${id}`);
  let currentId = id
  let newGuess = compareWords(guess, currentId);
  console.log(newGuess);
  cardAttempt.innerHTML = `${newGuess}`;
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
  const flipButton = document.querySelectorAll('.flipButton');
  flipButton.forEach(button => {
    button.addEventListener("click", (flipCard));
  });
};

export { bindFlip, scoreIncrement }
