const showAnswers = () => {
  const cardContainer = document.querySelector('.card-container');
  const cardAnswer = document.querySelectorAll('#card-answer-visible');
  cardContainer.classList.toggle('card-container-toggle');
  cardAnswer.forEach(answer => {
    answer.classList.toggle('show-card');
  });
};

const revealCard = () => {
  const revealButton = document.querySelector('.reveal-answers');
  revealButton.addEventListener('click', (showAnswers));
};

export { revealCard }
