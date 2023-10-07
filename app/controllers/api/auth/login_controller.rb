module Api
	module Auth
		class LoginController < ApplicationController
		
			def login
				response_with_data(
					interactor: ::Auth::Login,
					params: {params: login_params}
				)
			end

			private

			def login_params
				params.permit(:email, :password)
			end

		end
	end
end