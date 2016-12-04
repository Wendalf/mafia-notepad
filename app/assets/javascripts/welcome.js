// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/


$(function(){

  // Menu settings
  $('#menuToggle, .menu-close').on('click', function(){
    $('#menuToggle').toggleClass('active');
    $('body').toggleClass('body-push-toleft');
    $('#theMenu').toggleClass('menu-open');
  });

  // hide buttons and show hidden form
  $("a#new_game").click(function(e) {
    $("div.buttons").fadeOut("slow", function(){
      $("div.hiddenform").fadeIn("slow");
    });    
    e.preventDefault();
  });

});
