class ApplicationController < ActionController::Base
  # before_filter :check_format

  protect_from_forgery with: :null_session # => stateless json api

  protected

  def check_format
    render :nothing => true, :status => 406 unless params[:format] == 'json' || request.headers["Accept"] =~ /json/
  end

end
