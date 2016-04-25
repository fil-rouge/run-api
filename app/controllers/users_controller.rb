class UsersController < AuthenticateController
  before_action :authenticate_user_from_token!, :only => [:update, :show, :destroy]

  def index
    # TODO : test
    @user = User.all
  end

  def update
    # TODO: test
    @user = User.find_by_id(params[:id])
    if @user == nil
      render json: ErrorsHelper.json_error(:bad_id)
    else
      if current_user.id != @user.id
        render json: ErrorsHelper.json_error(:bad_user_id)
      else
        if @user.update_attributes(user_params)
          @user
        else
          render json: ErrorsHelper.json_error
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
      render json: ErrorsHelper.json_errorv(:bad_user_id)
    end
  end

  def destroy
    # TODO : test
    user_id = params[:id].presence.to_i

    #  check if you want to delete yourself
    if current_user.id == user_id
      @user = User.find_by_id(user_id)
      if @user.delete
        @user
      else
        render json: ErrorsHelper.json_error
      end
    else
      render json: ErrorsHelper.json_error(:bad_user_id)
    end
  end

private
  def user_params
      params.require(:user).permit(:name, :surname, :email, :password, :password_confirmation, :age, :phone_number)
  end
end