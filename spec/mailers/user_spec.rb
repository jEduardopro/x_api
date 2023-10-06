require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "confirm_account" do
    let(:mail) { UserMailer.confirm_account }

    it "renders the headers" do
      expect(mail.subject).to eq("Confirm account")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
