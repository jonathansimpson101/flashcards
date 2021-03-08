import confetti from "canvas-confetti";
const canvasConfetti = () => {
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

export {canvasConfetti};
