module Api
	module Auth
		class RegisterController < ApplicationController

			def register
				# binding.pry
				response_with_interactor(interactor: ::Auth::Register, params: register_params)
			end

			private

			def	register_params
				params.permit(:name, :email, :password)
			end

		end
	end
end