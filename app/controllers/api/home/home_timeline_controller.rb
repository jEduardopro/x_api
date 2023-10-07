module Api
	module Home
		class HomeTimelineController < AuthenticatedController

			def index
				
				render json: {message: "home timeline ctrl", user: ProfileSerializer.new(user)}, status: :ok

			end

		end
	end
end