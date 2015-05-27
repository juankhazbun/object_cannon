FactoryGirl.define do
  factory :player do
  	name Faker::Name.name 
  	wall_health 100
  
	  factory :player_win do
	  	wall_health 100
	  end

	  factory :player_lose do
	  	wall_health 1
	  end
  end
end