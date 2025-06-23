class UserMailer < ApplicationMailer
  default from: "notifications@example.com"

  def welcome_email
    @user = params[:user]
    @url  = "http://example.com/login"
    mail(
    to: email_address_with_name(@user.email, @user.name),
    subject: "Welcome to My Awesome Site"
  )
  end

  def welcome
    attachments.inline["images.jpg"] = File.read(Rails.root.join("app/assets/images/images.jpg"))
  end
end
