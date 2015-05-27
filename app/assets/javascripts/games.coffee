ready = ->
  $("a[data-remote]").on "ajax:success", (e, data, status, xhr) ->
    game = $.parseJSON(xhr.responseText)
    if game["winner"] isnt 0
      window.location.replace("/games/ranking")
    else
      changeTurn(game["turn"])
      attack = 0
      if parseInt(game["turn"]) is 1
        attack = $("#player1_wall_health").text() - game["player1"]["wall_health"]
        if attack is 0
          $("#hits-log").prepend("<p>" + game["player2"]["name"] + " missed the shot.</p>" )
        else
          $("#hits-log").prepend("<p>" + game["player2"]["name"] + " hit the wall. Damage: " + attack + "</p>")
          $("#player1_wall").height(game["player1"]["wall_health"] * 3).effect("shake") 
      else
        attack = $("#player2_wall_health").text() - game["player2"]["wall_health"]
        if attack is 0
          $("#hits-log").prepend("<p>" + game["player1"]["name"] + " missed the shot.</p>" )
        else
          $("#hits-log").prepend("<p>" + game["player1"]["name"] + " hit the wall. Damage: " + attack + "</p>")
          $("#player2_wall").height(game["player2"]["wall_health"] * 3).effect("shake") 
      $("#player1_wall_health").text((game["player1"]["wall_health"]).toString())
      $("#player2_wall_health").text(game["player2"]["wall_health"].toString())

changeTurn = (turn) ->
  if turn is 1
    $("#player1_button").removeClass('disabled')
    $("#player2_button").addClass('disabled')
  else
    $("#player2_button").removeClass('disabled')
    $("#player1_button").addClass('disabled')

$(document).ready(ready)
$(document).on('page:load', ready)