FactoryGirl.define do
  factory :game do
    association :player1, factory: :player 
    association :player2, factory: :player 
    turn 1
    winner 0
  end
end