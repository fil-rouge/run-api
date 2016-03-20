class WelcomeController < ActionController::Base

  def index
    render json: {
      :connexion => [:lien => '/users/sign_in(.:format)', :methode => 'Post']
    }
  end
end
