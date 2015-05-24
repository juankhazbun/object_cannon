require 'rails_helper'

describe Game do

	it { is_expected.to belong_to(:player1) }

	it { is_expected.to belong_to(:player2) }

	it { is_expected.to validate_inclusion_of(:turn).in_array([1, 2]) }

	it { is_expected.to validate_inclusion_of(:winner).in_array([1, 2]) }
end
