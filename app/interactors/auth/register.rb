module Auth
	class Register
		include Integrations::Interactor

		def call
			user = User.new(params)

			return set_result(user) if user.save

			add_bad_request_error!(user.errors)
		end

		private 

		delegate :params, to: :context
		
	end
end