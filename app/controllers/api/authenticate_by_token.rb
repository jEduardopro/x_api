module Api
	module AuthenticateByToken
		extend ActiveSupport::Concern

		included do
			before_action :authenticate_user
		end

		def authenticate_user
			return true if @user.present?

			authenticate_with_http_token do |token|
				interactor = Sessions::DecodeAuthToken.call(token:)
				return false unless interactor.success?

				payload = interactor.result
				@user = User.find_by(uuid: payload['data']['uuid'])

				return false unless user.present?

				return true
			end
		end

	end
end