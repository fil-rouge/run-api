class SessionsController < Devise::SessionsController
  def create
    respond_to do |format|
      format.json do
        self.resource = warden.authenticate!(auth_options)
        sign_in(resource_name, resource)
        data = {
          data: {
            token: self.resource.authentication_token,
            email: self.resource.email
          }
        }
        byebug
        render json: data, status: 201
      end
      format.html do
        super
      end
    end
  end
end