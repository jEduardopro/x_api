module Tweets
	class Create
		include Integrations::Interactor

		after :dispatch_event

		def call
			@tweet = user.tweets.new(create_params)
			add_bad_request_error!(tweet.errors) unless tweet.save

			set_result(tweet)
		end

		private

		delegate :create_params, :user, to: :context
		attr_reader :tweet

		def dispatch_event
			TweetCreatedJob.perform_later(tweet.id)
		end

	end
end