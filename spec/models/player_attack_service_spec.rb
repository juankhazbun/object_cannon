require 'rails_helper'

describe PlayerAttackService do

	before(:each) do
		# Insert player 1
		player1 = create(:player)

		# Insert Player 2
		player2 = create(:player)

		# Create a new game
		@game = create(:game, player1: player1, player2: player2)

		# Create service to attack
		@attack_service = PlayerAttackService.new @game.id
	end

	context 'hitting the opponent'do 

		it "player1 hit the opponent" do

			hit_points = @attack_service.attack

			@game.reload

			expect(@game.player2.wall_health).to be < 100 if hit_points > 0

			expect(@game.player2.wall_health).to eq 100 if hit_points == 0
		end
	end

	context 'one player is almost done' do

		before(:each) do
			# Insert player 1
			player1 = create(:player_win)

			# Insert Player 2
			player2 = create(:player_lose)

			# Create a new game
			@game = create(:game, player1: player1, player2: player2)

			# Create service to attack
			@attack_service = PlayerAttackService.new @game.id
		end

		it "player1 win the game" do

			hit_points = @attack_service.attack

			@game.reload

			expect(@game.winner).to eq(1) if hit_points > 0

			expect(@game.winner).to eq(0) if hit_points == 0
		end

		it 'the health could not be negative' do
			# stub the extra hit points to get 20 attributes 
			allow(@attack_service).to receive(:get_extra_hit_points).and_return(20)

			hit_points = @attack_service.attack

			@game.reload

			expect(@game.player2.wall_health).to eq(0)
		end
	end


end