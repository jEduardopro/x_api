class AuthenticatedController < ApplicationController
	include ActionController::HttpAuthentication::Token::ControllerMethods
	include Api::ResponseHelper
	include Api::AuthenticateByToken

	attr_reader :user

	append_before_action :after_authenticating

	def after_authenticating
		render json: {message: "Unauthorized"}, status: :unauthorized unless user.present?
	end

end