module Sessions
	class GenerateAuthToken
		include Integrations::Interactor

		def call
			add_bad_request_error!('User not found') unless user.present?

			set_result(JWT.encode(payload, secret_key))
		end

		delegate :user, to: :context

		def payload
			{sub: user.id, iat: expiration, exp: expiration, data: token_data}
		end

		def expiration
			24.hours.from_now.to_i
		end

		def token_data
			{uuid: user.uuid}
		end

		def secret_key
			ENV['JWT_SECRET_KEY']
		end

	end
end