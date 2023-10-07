module Auth
	class ConfirmAccount
		include Integrations::Interactor

		def call
			user = User.find_by(token: params[:token])
			
			add_bad_request_error!('Invalid token') unless user.present?
			
			add_bad_request_error!('Account already confirmed') if user.email_verified_at
			
			add_bad_request_error!(user.errors) unless user.update(email_verified_at: Time.zone.now, token: nil)

		end

		delegate :params, to: :context

	end
end