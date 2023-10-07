module Sessions
	class DecodeAuthToken
		include Integrations::Interactor

		def call
			add_bad_request_error!('Invalid token') unless token.present?

			set_result(JWT.decode(*args).first)
		rescue JWT::VerificationError, 
					 JWT::DecodeError,
					 JWT::ExpiredSignature,
					 OpenSSL::PKey::RSAError => e
			add_bad_request_error!(e.message)

		end

		delegate :token, to: :context

		private

		def args
			[auth_token, secret_key]
		end

		def auth_token
			token.gsub('Bearer ', '')
		end

		def secret_key
			ENV['JWT_SECRET_KEY']
		end

	end
end