module Tweets
	class Create
		include Integrations::Interactor

		def call
			tweet = user.tweets.new(create_params)
			add_bad_request_error!(tweet.errors) unless tweet.save

			set_result(tweet)
		end

		private

		delegate :create_params, :user, to: :context

	end
end