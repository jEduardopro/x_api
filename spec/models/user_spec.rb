describe User, type: :model do

	subject { create(:user) }
	describe 'validations' do
		it { should validate_presence_of(:uuid) }
		it { should validate_uniqueness_of(:uuid) }
		it { should validate_presence_of(:email) }
		it { should validate_uniqueness_of(:email) }
		it { should validate_presence_of(:name) }
	end

	describe '.authenticate' do
		it { expect(subject.authenticate('fake_password')).to be_falsy }
		it { expect(subject.authenticate('password')).to be_truthy }
	end

end