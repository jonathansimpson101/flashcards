import Typed from 'typed.js';

const divContent = document.getElementById('type-here');
const divContent2 = document.getElementById('type-here-2');

const initTyped = new Typed(divContent, {
                            strings: [
                              "Hyper-Text Mark-Up Language"
                            ],
                            typeSpeed: 100,
                            backSpeed: 100,
                            loop: true
                      });

const initTyped2 = new Typed(divContent2, {
                            strings: [
                              "Bonjour le monde.",
                              "Bonjour, comment vas tu aujourdi'hui?"
                            ],
                            typeSpeed: 100,
                            backSpeed: 100,
                            smartBackspace: true,
                            loop: true
                        });

export { initTyped2 }
