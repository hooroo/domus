const buttons = document.querySelectorAll(".sub-header .button");
const tabs = document.querySelectorAll(".tab");

function toggleActive(e) {
  target_class_name = e.target.dataset["target"];
  tabs.forEach(tab => tab.classList.remove("active"));
  document.querySelector(`.tab.${target_class_name}`).classList.add("active");
}

buttons.forEach(button => button.addEventListener("click", toggleActive));
