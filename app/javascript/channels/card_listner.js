const initCardListener = () => {
  document.getElementById("hidden_button_edit").addEventListener("click", (event) => {
    document.querySelector(".d-none.hidden_form").classList.remove("d-none");
  });
};

const initCardListener2 = () => {
  document.getElementById("hidden_button_new").addEventListener("click", (event) => {
    document.querySelector(".d-none.hidden_form").classList.remove("d-none");
  });
};
export { initCardListener, initCardListener2 };
