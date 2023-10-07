module Api
	module Auth
		class RegisterController < ApplicationController

			def register
				response_with_message(
					interactor: ::Auth::Register, 
					params: {params: register_params}, 
					message: 'User created successfully, check your email to confirm your account'
				)
			end

			private

			def	register_params
				params.permit(:name, :email, :password)
			end

		end
	end
end