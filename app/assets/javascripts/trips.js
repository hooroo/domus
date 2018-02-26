function showCurrentTrips(){
  document.getElementById("current_trips").style.display = "block";
  document.getElementById("past_trips").style.display = "none";
  document.getElementById("all_trips").style.display = "none";
}

function showPastTrips(){
  document.getElementById("past_trips").style.display = "block";
  document.getElementById("current_trips").style.display = "none";
  document.getElementById("all_trips").style.display = "none";
}

function showAllTrips(){
  document.getElementById("all_trips").style.display = "block";
  document.getElementById("past_trips").style.display = "none";
  document.getElementById("current_trips").style.display = "none";
}
