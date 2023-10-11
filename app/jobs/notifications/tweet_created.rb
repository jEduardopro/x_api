module Notifications
	class TweetCreated

		def dispatch(tweet_id)
			tweet = Tweet.includes(user: [:followers]).find(tweet_id)
			following_users = tweet.user.followers.pluck('uuid')

			following_users.each do |user_uuid|
				PusherNotificationJob.perform_later(user_uuid, 'tweet_created', TweetSerializer.new(tweet).as_json)
			end
		end

	end
end