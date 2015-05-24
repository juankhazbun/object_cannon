require 'rails_helper'

describe Player do

	it { is_expected.to validate_presence_of(:name) }

	it { is_expected.to validate_length_of(:name).is_at_most(50) }
	
	it { is_expected.to validate_inclusion_of(:wall_health).in_range(0..100) }
end
