require 'rails_helper'

describe User, type: :model do

	subject { create(:user) }
	describe 'validations' do
		it { should validate_presence_of(:uuid) }
	end

end