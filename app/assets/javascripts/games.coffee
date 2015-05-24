ready = ->
  $("a[data-remote]").on "ajax:success", (e, data, status, xhr) ->
    game = $.parseJSON(xhr.responseText)
    console.log "Winner:" + game["winner"]
    if game["winner"] isnt 0
      window.location.replace("/games/ranking")
    else
      attack = 0
      if parseInt(game["turn"]) is 2
        attack = $("#player1_wall_health").text() - game["player1"]["wall_health"]
      else
        attack = $("#player2_wall_health").text() - game["player2"]["wall_health"]
      if parseInt(game["turn"]) is 1
        if attack is 0
          $("#hits-log").prepend("<p>" + game["player1"]["name"] + " missed the shot.</p>" )
        else
          $("#hits-log").prepend("<p>" + game["player1"]["name"] + " hit the wall. Damage: " + attack + "</p>")
          $("#player2_wall").height(game["player2"]["wall_health"] * 3) 
      else
        if attack is 0
          $("#hits-log").prepend("<p>" + game["player2"]["name"] + " missed the shot.</p>" )
        else
          $("#hits-log").prepend("<p>" + game["player2"]["name"] + " hit the wall. Damage: " + attack + "</p>")
          $("#player1_wall").height(game["player1"]["wall_health"] * 3) 
      $("#player1_wall_health").text((game["player1"]["wall_health"]).toString())
      $("#player2_wall_health").text(game["player2"]["wall_health"].toString())

    
$(document).ready(ready)
$(document).on('page:load', ready)