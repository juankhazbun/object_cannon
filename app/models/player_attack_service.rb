# Player helper to execute the attack and calculate 
# the hit points
#
# @author   Juan Carlos Hazbun Nieto<mailto:juankhazbun@gmail.com>
# @version  1.0, May 2015
# @since    1.0
class PlayerAttackService

  def initialize(game_id)
    @game = Game.find(game_id)
  end
  
  # Attack the player depending on the turn
  def attack 
    # Calculate the attributes of the object
    attributes = rand(6)

    puts "Turn: " + @game.turn.to_s

    puts "Basic attributes: " + attributes.to_s

    # Get extra hit points
    attributes += get_extra_hit_points

    # Execute the attack to the corresponding player
    if @game.turn == 1
      @game.player2.wall_health = hit(@game.player2, attributes)

      if @game.player2.wall_health == 0
        @game.winner = 1
      end

      # Change player turn
      @game.turn = 2
    else
      @game.player1.wall_health = hit(@game.player1, attributes)

      if @game.player1.wall_health == 0
        @game.winner = 2
      end

      # Change player turn
      @game.turn = 1
    end

    puts "Winner: " + @game.winner.to_s
    # Update the object game
    @game.save
    attributes
  end

  def hit(player, damage)
    # Check if the remaining health is not enough
    return player.wall_health - damage if player.wall_health - damage > 0
    return 0
  end

  # Calculate the chances and get extra hit points
  def get_extra_hit_points
    # Calculate the chance for extra attributes
    chance = (rand * 100).to_i

    puts "Chance: " + chance.to_s

    attributes = 0

    case chance
      when 20
        attributes = 2
      when 10
        attributes = 5
      when 5
        attributes = 10
      when 1
        attributes = 20
    end
    puts "Extra attributes: " + attributes.to_s
    attributes
  end 
  
end