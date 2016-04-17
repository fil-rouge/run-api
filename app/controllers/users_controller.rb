class UsersController < AuthenticateController
  before_action :authenticate_user_from_token!, :only => [:update, :show, :destroy]

  def index
    # TODO : test
    @userCount = User.all
  end

  def update
    # TODO: test
    @user = User.find_by_id(params[:id])
    if @user == nil
      render json: {:error => "no user found"}
    else
      if current_user.id != @user.id
        render json: {:error => "you can not edit an other user than yourself"}
      else
        if @user.update_attributes(user_params)
          @user
        else
          render json: {:error => "Nothing has been changed on the user"}
        end
      end
    end
  end

  def show
    # TODO : test
    user_id = params[:id].presence.to_i

    #  check if you ask informations about the current_user or someone else
    if current_user.id == user_id
      @user = User.find_by_id(user_id)
    else
      render json: {:error => 'We are sorry, due to privacy, you can only get the informations about yourself'}
    end
  end

  def destroy
    # TODO : test
    user_id = params[:id].presence.to_i

    #  check if you want to delete yourself
    if current_user.id == user_id
      @user = User.find_by_id(user_id)
      if @user.delete
        render json: {:data => @user}
      else
        render json: {:error => 'an error occured, the user is not deleted'}
    end
    else
      render json: {:error => 'We are sorry, you can not delete an other user than yourself'}
    end
  end

private
  def user_params
      params.require(:user).permit(:name, :surname, :email, :password, :password_confirmation, :age, :phone_number)
  end
end