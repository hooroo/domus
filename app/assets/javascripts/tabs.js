const buttons = document.querySelectorAll(".sub-header .button");
const tabs = document.querySelectorAll(".tab");

function toggleActive(e) {
  e.preventDefault();
  target_class_name = e.target.dataset["target"];

  buttons.forEach(button => button.classList.remove("active"));
  tabs.forEach(tab => tab.classList.remove("active"));
  e.target.classList.add("active");
  document.querySelector(`.tab.${target_class_name}`).classList.add("active");
}

buttons.forEach(button => button.addEventListener("click", toggleActive));
