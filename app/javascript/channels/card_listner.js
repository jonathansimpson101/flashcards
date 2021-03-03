const initCardListener = () => {
  document.getElementById("hidden_button").addEventListener("click", (event) => {
    document.querySelector(".d-none.hidden_form").classList.remove("d-none")
  });

};

export {initCardListener};
