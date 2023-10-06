module Auth
	class Register
		include Integrations::Interactor

		after :send_confirmation_email

		def call			
			@user = User.new(params)

			return set_result(user) if user.save

			add_bad_request_error!(user.errors)
		end

		delegate :params, to: :context

		private

		attr_reader :user

		def send_confirmation_email
			UserMailer.confirm_account(user).deliver_later
		end

	end
end