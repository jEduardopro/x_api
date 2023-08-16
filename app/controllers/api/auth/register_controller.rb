module Api
	module Auth
		class RegisterController < ApplicationController

			def register
				user = User.new(register_params)
				if user.save
					render json: {message: "register success", user: user}
				else
					render json: {message: user.errors, status: 422}, status: 422
				end 
			end

			private

			def	register_params
				params.permit(:name, :email, :password)
			end

		end
	end
end