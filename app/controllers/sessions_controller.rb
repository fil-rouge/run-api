class SessionsController < Devise::SessionsController
  respond_to :json, :js
  def create
    respond_to do |format|
      format.json do
        self.resource = warden.authenticate!(auth_options)
        sign_in(resource_name, resource)
        data = {
          token: self.resource.authentication_token,
          email: self.resource.email
        }
        render json: data, status: 201
      end
      format.html do
        super
      end
      format.js do
        self.resource = warden.authenticate!(auth_options)
        sign_in(resource_name, resource)
        data = {
          token: self.resource.authentication_token,
          email: self.resource.email
        }
        render :json => data, :callback => params[:callback]
      end
    end
  end
end