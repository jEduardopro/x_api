module Api
	module Auth
		class ConfirmAccountController < ApplicationController

			def confirm_account
				response_with_message(
					interactor: ::Auth::ConfirmAccount,
					params: {params: confirm_account_params},
					message: 'Account confirmed successfully'
				)
			end

			private

			def confirm_account_params
				params.permit(:token)
			end

		end
	end
end