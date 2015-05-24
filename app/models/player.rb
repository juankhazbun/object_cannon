class Player < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 50 } 
	validates :wall_health, inclusion: { in: 0..100 }
end
