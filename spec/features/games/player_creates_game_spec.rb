require 'rails_helper'

feature 'Player creates a new game' do
  
  before(:each) do  
    visit new_game_path   
    @game = build(:game) 
  end
  
  scenario 'with valid input' do 
    fill_in 'game_player1_attributes_name', with: @game.player1
    fill_in 'game_player2_attributes_name', with: @game.player2
    click_button 'Create Game'    
    expect(page).to have_content 'Games#show'
  end
  
  scenario 'with invalid input' do
    click_button 'Create Game'    
    expect(page).to have_content "can't be blank"
  end
end