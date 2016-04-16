class AuthenticateController < ApplicationController
  # before_action :authenticate_user_from_token! # =>  only user authenticated can have acces to that controller

  protected
  def authenticate_user_from_token!
    #  authentificate from the header : id and token from the current user
    user_id = request.headers["HTTP_USER_ID"].presence
    user_token = request.headers["HTTP_TOKEN"].presence

    user = user_id && User.find_by_id(user_id)

    if !user.blank?
      if user && Devise.secure_compare(user.authentication_token, user_token)
        sign_in user, store: false
      else
        render json: {:error => 'Invalid authorization: your token is not valid '}
      end
    else
      render json: {:error => "Invalid authorization: you need to give the user id and the authenthification token in the header as HTTP_USER_ID and HTTP_TOKEN"}
    end

  end
end
