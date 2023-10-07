module Auth
	class Login
		include Integrations::Interactor

		def call
			user = User.find_by(email: params[:email])

			add_bad_request_error!('Credentials are invalid') unless user.present?

			add_bad_request_error!('Account not confirmed') unless user.email_verified_at.present?

			add_bad_request_error!('Credentials are invalid') unless user.authenticate(params[:password])

			set_result({token: 'test=toekn', user: UserSerializer.new(user) })

		end

		delegate :params, to: :context

	end
end