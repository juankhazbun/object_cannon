# Player helper to execute the attack and calculate 
# the hit points
#
# @author   Juan Carlos Hazbun Nieto<mailto:juankhazbun@gmail.com>
# @version  1.1, May 2015
# @since    1.0
class PlayerAttackService

  def initialize(game_id)
    @game = Game.find(game_id)
  end
  
  # Attack the player depending on the turn
  def attack 
    # Calculate the attributes of the object
    attributes = rand(6)

    # Get extra hit points
    attributes += get_extra_hit_points

    # Execute the attack to the corresponding player
    if @game.turn == 1
      @game.player2.wall_health = hit(@game.player2, attributes)

      # Check if player 1 won the game
      @game.winner = 1 if wall_down? @game.player2

      # Change player turn
      @game.turn = 2
    else
      @game.player1.wall_health = hit(@game.player1, attributes)

      # Check if player 2 won the game
      @game.winner = 2 if wall_down? @game.player1

      # Change player turn
      @game.turn = 1
    end
    # Update the object game
    @game.save
    attributes
  end

  def hit(player, damage)
    # Check if the remaining health is not enough
    return player.wall_health - damage if player.wall_health - damage > 0
    return 0
  end

  # Check for winner
  def wall_down? player
    return true if player.wall_health == 0
    return false 
  end

  # Calculate the chances and get extra hit points
  # The chances are taken from 0 to 0.36 to cover 
  # the required chances
  #
  # Ruby rand is a modified implementation of a 
  # Mersenne Twister. We assume that rand generates 
  # a start from a uniform distribution
  def get_extra_hit_points
    # Calculate the chance for extra attributes
    chance = rand

    attributes = 0

    # Check the chance of extra hit points
    if chance > 0 && chance <= 0.2
      attributes = 2
    elsif chance > 0.2 && chance <= 0.3
      attributes = 5
    elsif chance > 0.3 && chance <= 0.35
      attributes = 10
    elsif chance > 0.35 && chance <= 0.36
      attributes = 20
    end
    attributes
  end 
  
end