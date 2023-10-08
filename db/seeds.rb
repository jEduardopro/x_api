
require 'factory_bot'

def create_seed_data(factory, count) 
	count.times { FactoryBot.create(factory) }
end

create_seed_data(:user, 10)

# Create follower relationships
User.all.each do |follower_user|
  # Choose random users to follow (you can adjust the count as needed)
  followed_users = User.where.not(id: follower_user.id).sample(rand(1..5))
  
  followed_users.each do |followed_user|
    FactoryBot.create(:follower, follower_id: follower_user.id, followed_id: followed_user.id)
  end
end