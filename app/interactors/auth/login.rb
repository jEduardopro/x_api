module Auth
	class Login
		include Integrations::Interactor

		def call
			@user = User.find_by(email: params[:email])

			add_bad_request_error!('Credentials are invalid') unless user.present?

			add_bad_request_error!('Account not confirmed') unless user.email_verified_at.present?

			add_bad_request_error!('Credentials are invalid') unless user.authenticate(params[:password])

			interactor = auth_token

			add_bad_request_error!(interactor.error) unless interactor.success?

			set_result({token: interactor.result, user: UserSerializer.new(user) })

		end

		delegate :params, to: :context
		attr_reader :user

		private

		def auth_token
			Sessions::GenerateAuthToken.call(user: user)
		end

	end
end