class ApplicationController < ActionController::Base
  # before_filter :authenticate_user_from_token! # =>  only user authenticated can have acces to that controller
  before_filter :check_format

  protect_from_forgery with: :null_session # => stateless json api

  protected

  def check_format
    render :nothing => true, :status => 406 unless params[:format] == 'json' || request.headers["Accept"] =~ /json/
  end

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
