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

  // ajax call for all current user's games and show result
  $("a#all_games").click(function(e) {
    e.preventDefault();

    var $games = $("div#hiddengames");
    var html = "<h3>Your Games</h3>";

    $.ajax({
      method: "GET",
      url: "/games",
      dataType: "json"
    })
      .done(function(data) {
        data.forEach(function(game, index, data) {
          html += `<p>Game ${index+1}: ${game.capacity} players | ${game.game_status}</p>`;
        });
        html += "<button type='button' class='btn btn-outline-primary'>Back</button>"
        $games.html(html);
        $("div.buttons").fadeOut("slow", function() {
          $("div#hiddengames").fadeIn("slow");

        });
      });
  });
  
  //going back from games field to toggled away buttons
  $("div#hiddengames").on("click", "button", function() {
    $("div#hiddengames").fadeOut("slow", function() {
      $("div.buttons").fadeIn("slow");
    });
  });

  //Javascript Model Objects and its prototype
  function Game(data) {
    this.id = data.id;
    this.status = data.game_status;
    this.players = data.players;
    this.nights = data.nights;
  }
  
  function Night(night) {
    this.id = night.id;
    this.logs = night.logs;
    this.notes = night.notes;
  }

  Game.prototype.buildNights = function() {
    var nights = this.nights;
    var nightsObjects = [];
    nights.forEach(function(night) {
      nightsObjects.push(new Night(night));
    });
    return nightsObjects;
  }

  Game.prototype.buildEditNightForm = function(nights) {
    var players = this.players;
    var lastNight = nights[nights.length - 1];
    var gameId = this.id;
    var nightId = lastNight.id;
    var formHtml = "<form class='edit_night' id='edit_night_" + nightId + "' action='/games/" + gameId + "/nights/" + nightId  + "/edit' accept-charset='UTF-8' method='post'><input name='utf8' type='hidden' value='✓'><input type='hidden' name='_method' value='patch'><label for='day_event_executed'>Did anyone get executed by voting to death?</label>&nbsp;<select name='day_event[executed]' id='day_event_executed'><option value=''>No one got executed</option>";

    players.forEach(function(player) {
      if(player.alive) {
        formHtml += "<option value='"+ player.id + "'>" + player.name + "</option>";
      }
    });
    
    formHtml += "</select><br/><br/><button type='button' class='btn btn-outline-primary'>Night is coming...</button></form>";
    return formHtml;
  }

  $( "form#new_night" ).on( "submit", function(e) {
    e.preventDefault();

    var $form = $(this);
    var action = $form.attr("action");
    var params = $form.serialize();
    $("div#edit_night_form").html("");

    $.ajax({
      url: action,
      data: params,
      dataType: "json",
      method: "POST"
    })
      .done(function(data) {
        var game = new Game(data);
        var nights = game.buildNights();
        var editFormHtml = game.buildEditNightForm(nights);
        $("div#edit_night_form").html(editFormHtml);
      });
  });





});
