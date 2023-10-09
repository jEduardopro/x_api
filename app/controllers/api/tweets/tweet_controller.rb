module Api
	module Tweets
		class TweetController < AuthenticatedController

			def create
				response_with_interactor(
					interactor: ::Tweets::Create,
					params: {create_params:, user:},
					serializer: TweetSerializer
				)
			end

			private

			def create_params
				params.permit(:body)
			end

		end
	end
end