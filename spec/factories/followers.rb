FactoryBot.define do

	factory :follower do
		association :follower, factory: :user
		association :followed, factory: :user
	end

end