class UserMailer < ApplicationMailer
  default from: "notifications@example.com"

  def welcome_email
    @user = params[:user]
    @url  = "http://example.com/login"
    mail(to: @user.email, subject: "Welcome to My Awesome Site")
  end

  def welcome
    attachments.inline["images.jpg"] = File.read(Rails.root.join("app/assets/images/images.jpg"))
  end
end
