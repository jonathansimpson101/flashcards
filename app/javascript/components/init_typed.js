import Typed from 'typed.js';


const callTyped = () => {
  const divContent = document.getElementById('type-here');
  const divContent2 = document.getElementById('type-here-2');
  const initTyped = new Typed(divContent, {
                              strings: [
                                "Hypr Test Mark-Up Lnguage",
                                "Hyper-Text Mark-Up Language"
                              ],
                              typeSpeed: 60,
                              backSpeed: 20,
                              smartBackspace: true,
                              loop: true,
                              cursorChar: ""
                              // fadeOut: true
                        });

  const initTyped2 = new Typed(divContent2, {
                              strings: [
                                "Bonjour le monde.",
                                "Bonjour, comment vas tu aujourdi'hui?"
                              ],
                              typeSpeed: 60,
                              backSpeed: 40,
                              smartBackspace: true,
                              loop: true,
                              cursorChar: ""
                          });
};

export { callTyped }
