module Api
	module Auth
		class RegisterController < ApplicationController

			def register
				user = User.new(register_params)
				if user.save
					render json: {message: "begin verification", description: "signup_with_email", email: user.email}
				else
					render json: {message: user.errors.full_messages, status: 417}
				end 
			end

			private

			def	register_params
				params.permit(:name, :email, :date_birth)
			end

		end
	end
end