// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/



// $(function(){

//   // ajax call for all current user's games and show result
//   $("a#all_games").click(function(e) {
//     e.preventDefault();

//     var $games = $("div#hiddengames");
//     var html = "<h3>Your Games</h3>";

//     $.ajax({
//       method: "GET",
//       url: "/games",
//       dataType: "json"
//     })
//       .done(function(data) {
//         data.forEach(function(game, index, data) {
//           html += `<p>Game ${index+1}: ${game.capacity} players | ${game.game_status}</p>`;
//         });
//         html += "<button type='button' class='btn btn-outline-primary'>Back</button>"
//         $games.html(html);
//         $("div.buttons").fadeOut("slow", function() {
//           $("div#hiddengames").fadeIn("slow");

//         });
//       });
//   });

//   $("div#hiddengames").on("click", "button", function() {
//     $("div#hiddengames").fadeOut("slow", function() {
//       $("div.buttons").fadeIn("slow");
//     });
//   });

// });
