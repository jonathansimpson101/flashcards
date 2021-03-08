const showAnswers = () => {
  const cardContainer = document.querySelector('.card-container');
  const cardAnswer = document.getElementById('card-answer-visible');
  cardContainer.classList.toggle('card-container-toggle');
  cardAnswer.classList.toggle('show-card');
};

const revealCard = () => {
  const revealButton = document.querySelector('.reveal-answers');
  revealButton.addEventListener('click', (showAnswers));
};

export { revealCard }
