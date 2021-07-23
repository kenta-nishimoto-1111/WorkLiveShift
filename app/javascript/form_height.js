window.onload = function() {
  var main = document.getElementById('area');

function scrollEnd() {
      main.scrollTop = main.scrollHeight;
      scrollEnd();
}}