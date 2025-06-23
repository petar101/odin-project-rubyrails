config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address:         "smtp.gmail.com",
  port:            587,
  domain:          "example.com",
  user_name:       Rails.application.credentials.dig(:smtp, :user_name),
  password:        Rails.application.credentials.dig(:smtp, :password),
  authentication:  "plain",
  enable_starttls: true,
  open_timeout:    5,
  read_timeout:    5 }
