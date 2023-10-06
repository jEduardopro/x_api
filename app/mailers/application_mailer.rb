class ApplicationMailer < ActionMailer::Base
  default from: "x_app@no-reply.com"
  layout "mailer"
end
