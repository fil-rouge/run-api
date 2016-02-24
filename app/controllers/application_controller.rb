class ApplicationController < ActionController::Base
  # before_filter :authenticate_user_from_token! # =>  only user authenticated can have acces to that controller

  protect_from_forgery with: :null_session # => stateless json api

  protected

  def authenticate_user_from_token!
    authenticated = authenticate_with_http_token do |user_token, options|
        user_email = options[:user_email].presence
        user       = user_email && User.find_by_email(user_email)

        if user && Devise.secure_compare(user.authentication_token, user_token)
          sign_in user, store: false
        else
          print 'Invalid authorization.'
          render json: 'Invalid authorization.'
        end
      end

    if !authenticated
      print 'No authorization provided.'
      render json: 'No authorization provided.'
    end
  end
end
