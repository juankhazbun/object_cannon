require 'rails_helper'

def have_damage_or_missed
	simple_matcher("check content has damage or missed") { |page| page.has_content?('missed') or page.has_content?('Damage') }
end

def wait_for_ajax
	Timeout.timeout(Capybara.default_wait_time) do
  		loop until finished_all_ajax_requests?
	end
end

feature 'Players play the game'  do 

	before(:each) do
		visit new_game_path   
    	@game = build(:game) 
    	fill_in 'game_player1_attributes_name', with: @game.player1.name
    	fill_in 'game_player2_attributes_name', with: @game.player2.name
    	click_button 'Create Game'    
	end

	scenario 'the names appears on the page' do
		expect(page).to have_content "Player1: #{ @game.player1.name }"
		expect(page).to have_content "Player1: #{ @game.player2.name }"
	end

	scenario 'the players start with 100 point of health' do   
		expect(page.first('#player1_wall_health').text).to eq "100"
		expect(page.first('#player2_wall_health').text).to eq "100"
	end

	scenario 'Player1 start hitting the opponents wall', :js => true do
		pending("problem with webdriver")
		click_link 'player1_button'
		wait_for_ajax
		expect(page).to have_damage_or_missed  
	end

	
end