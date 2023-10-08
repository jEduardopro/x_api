require 'factory_bot'

def create_seed_data(factory, count) 
	count.times { FactoryBot.create(factory) }
end

User.destroy_all

test_user = FactoryBot.create(:user, 
	name: 'john doe', 
	username: "#{'john doe'.parameterize(separator: '_', preserve_case: false)}#{Random.rand(1000)}",
	email: 'john_doe@test.com', 
	password: 'secretpass'
)

FactoryBot.create_list(:tweet, 100, user: test_user)

create_seed_data(:user, 100)

User.limit(100).where.not(id: test_user.id).each do |user|
	user.given_follows.create(followed_id: test_user.id)
	FactoryBot.create_list(:tweet, 100, user: user)
end

create_seed_data(:user, 100)

User.last(100).each do |user|
	test_user.given_follows.create(followed_id: user.id)
	FactoryBot.create_list(:tweet, 100, user: user)
end

User.all.each do |follower_user|
  followed_users = User.where.not(id: follower_user.id).where.not(id: test_user.id).sample(rand(5..90))
  
  followed_users.each do |followed_user|
    FactoryBot.create(:follower, follower_id: follower_user.id, followed_id: followed_user.id)
  end
end