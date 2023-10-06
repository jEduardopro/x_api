module Api
	module Auth
		class RegisterController < ApplicationController

			def register
				response_with_interactor(interactor: ::Auth::Register, params: {params: register_params})
			end

			private

			def	register_params
				params.permit(:name, :email, :password)
			end

		end
	end
end