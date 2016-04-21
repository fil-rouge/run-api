# Be sure to restart your server when you modify this file.

# Configure sensitive parameters which will be filtered from the log file.
Rails.application.config.filter_parameters += [:password]
# tokens
Rails.application.config.filter_parameters += [:authentication_token]
Rails.application.config.filter_parameters += [:confirmation_token]
Rails.application.config.filter_parameters += [:reset_password_token]
