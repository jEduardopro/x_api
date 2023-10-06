class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.confirm_account.subject
  #
  def confirm_account(user)
    @greeting = "Hi"
		@user = user

    mail to: @user.email, subject: "Confirm your account"
  end
end
