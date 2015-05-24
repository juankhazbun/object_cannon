class GamesController < ApplicationController
  before_action :set_game, only: [:show, :attack]

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
  end

  def ranking
  	# TODO: paginate the results
  	@games = Game.all
  end

  def attack
    
    # Create the subscriber service to check for prizes
    player_attack = PlayerAttackService.new(params[:id])
    @attack = player_attack.attack

    respond_to do |format|
      format.json { render json: @game, root: false }
    end
  end

  private 

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
  	params.require(:game).permit(player1_attributes: [:id, :name], player2_attributes: [:id, :name])
  end
end
