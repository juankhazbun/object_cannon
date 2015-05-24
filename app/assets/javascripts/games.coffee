ready = ->
  $("a[data-remote]").on "ajax:success", (e, data, status, xhr) ->
    game = $.parseJSON(xhr.responseText)
    console.log game
    
    console.log(attack(game))
    $("#player1_wall_health").text((game["player1"]["wall_health"]).toString())
    $("#player2_wall_health").text(game["player2"]["wall_health"].toString())
    

attack = (game) ->
  if game["turn"] is 1
    $("#player1_wall_health").text() - game["player1"]["wall_health"]
  else  
    $("#player2_wall_health").text() - game["player2"]["wall_health"]
  

$(document).ready(ready)
$(document).on('page:load', ready)