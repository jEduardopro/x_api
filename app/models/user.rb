class User < ApplicationRecord
	include HasUuid

	attr_accessor :password

	validates :uuid, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :name, presence: true
	validates :password, presence: true
	before_create :set_username, :set_token

	def password=(password_str)
		unless password_str.blank?
			@password = password_str
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_digest = BCrypt::Engine.hash_secret(@password, password_salt)
		end
	end

	def authenticate(password_str)
		password.present? && password_digest.present? && password_digest == BCrypt::Engine.hash_secret(password_str, password_salt)
	end

	private 

	def set_username
		self.username = "#{self.name.parameterize(separator: '_', preserve_case: false)}#{Random.rand(1000)}"
	end

	def set_token
		self.token = SecureRandom.urlsafe_base64
	end
	
end