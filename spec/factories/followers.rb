FactoryBot.define do

	factory :follower do
		follower_id { create(:user).id }
		followed_id { create(:user).id }
	end

end