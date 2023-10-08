class User < ApplicationRecord
	include HasUuid

	attr_accessor :password

	validates :uuid, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :name, presence: true
	validates :username, presence: true, uniqueness: true
	validates :password, presence: true, unless: :skip_password_validation
	# validates :token, presence: true, uniqueness: true, on: :create

	# Will return an array of follows for the given user instance
  has_many :received_follows, foreign_key: :followed_id, class_name: "Follower"

  # Will return an array of users who follow the user instance
  has_many :followers, through: :received_follows, source: :follower, dependent: :destroy
    
  # returns an array of follows a user gave to someone else
  has_many :given_follows, foreign_key: :follower_id, class_name: "Follower"
  
  # returns an array of other users who the user has followed
  has_many :followings, through: :given_follows, source: :followed, dependent: :destroy
	has_many :tweets, dependent: :destroy

	def password=(password_str)
		unless password_str.blank?
			@password = password_str
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_digest = BCrypt::Engine.hash_secret(@password, password_salt)
		end
	end

	def authenticate(password)
		password.present? && password_digest.present? && password_digest == BCrypt::Engine.hash_secret(password, password_salt)
	end

	private 

	def skip_password_validation
		(password_salt.present? && password_digest.present?)
	end
	
end