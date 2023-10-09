module Api
	module Home
		class HomeTimelineController < AuthenticatedController
			include PaginationParams

			def index
				response_with_collection(
					interactor: ::Home::Index,
					params: {pagination_params:, user:},
					serializer: TweetSerializer
				)
			end

		end
	end
end