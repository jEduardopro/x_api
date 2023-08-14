FactoryBot.define do

	factory :user do
		name { Faker::Name.name }
		username { Faker::Internet.unique.username }
		email { Faker::Internet.unique.email }
		email_verified_at { Time.now }
		password { 'password' }

	end

end