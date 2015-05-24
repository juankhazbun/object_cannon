class GamesController < ApplicationController
  def new
  	@game = Game.new
  	@game.player1 = Player.new
  	@game.player2 = Player.new
  end

  def create
  	@game = Game.new(game_params)

  	if @game.save
  		redirect_to @game
  	else
		render 'new'
  	end
  end

  def show
  	@game = Game.find(params[:id])
  end

  def ranking
  	# TODO: paginate the results
  	@Game = Game.all
  end

  def attack
    # Create the subscriber service to check for prizes
    player_attack = PlayerAttackService.new(params[:id])
    @attack = player_attack.attack

    respond_to do |format|
      format.js { render json: @game }
    end
  end

  private 
  def game_params
  	params.require(:game).permit(player1_attributes: [:id, :name], player2_attributes: [:id, :name])
  end
end
