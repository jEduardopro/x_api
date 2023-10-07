module Auth
	class Register
		include Integrations::Interactor

		after :send_confirmation_email

		def call			
			@user = User.new(user_params)
			return set_result(user) if user.save

			add_bad_request_error!(user.errors)
		end

		delegate :params, to: :context

		private

		attr_reader :user

		def send_confirmation_email
			UserMailer.confirm_account(user).deliver_later
		end

		def user_params
			params.merge(username: username, token: token)
		end

		def username
			return '' if params[:name].blank?
			"#{params[:name].parameterize(separator: '_', preserve_case: false)}#{Random.rand(1000)}"
		end
	
		def token
			SecureRandom.urlsafe_base64
		end

	end
end