class AuthenticateController < ApplicationController
  # before_action :authenticate_user_from_token! # =>  only user authenticated can have acces to that controller
  before_action :authenticate_api_from_api_token! # =>  only user authenticated can have acces to that controller
  SALT = {
    "ember" => "coucou",
    "angular" => "coucou"
  }



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
        render json: ErrorsHelper.json_error(:invalid_token)
      end
    else
      render json: ErrorsHelper.json_error(:invalid_header)
    end
  end

  def authenticate_api_from_api_token!
    api_token = request.headers["HTTP_API_TOKEN"].presence
    tok = Api_token.all
    tokens = tok.each { |k| k[:token]}
    if tokens.include? api_token
      return
    else
      render json: ErrorsHelper.json_error(:bad_api_key, 420), status: 420
    end
  end

  def invalidate_token token
    api_token = Api_token.find_by(token: token)
    salt =  salt[api_token.api]
    api_token.token = Digest::SHA2.new << token + salt[api_token.api]
  end
end
