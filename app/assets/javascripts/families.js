function showActiveFamilies(){
  document.getElementById("active_families").style.display = "block";
  document.getElementById("inactive_families").style.display = "none";
  document.getElementById("all_families").style.display = "none";
}

function showNotActiveFamilies(){
  document.getElementById("inactive_families").style.display = "block";
  document.getElementById("active_families").style.display = "none";
  document.getElementById("all_families").style.display = "none";
}

function showAllFamilies(){
  document.getElementById("all_families").style.display = "block";
  document.getElementById("inactive_families").style.display = "none";
  document.getElementById("active_families").style.display = "none";
}
