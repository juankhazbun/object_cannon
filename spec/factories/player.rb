FactoryGirl.define do
  factory :player do
  	name Faker::Name.name 
  	wall_health 100
  end
end