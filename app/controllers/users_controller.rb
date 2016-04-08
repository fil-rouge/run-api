class UsersController < AuthenticateController


  def new
    # TODO: delete from route
  end

  def create
    # TODO: inplement
  end

  def index
    # TODO : test
    @userCount = User.count
    render json: {:data => @userCount}
  end

  def edit
    # TODO: inplement
  end

  def show
    # TODO : test
    user_id = params[:id].presence.to_i

    #  check if you ask informations about yourself
    if current_user.id == user_id
      @user = User.find_by_id(user_id)
      render json: {:data => @user}
    else
      render json: {:error => 'We are sorry, due to privacy, you can only get the informations about yourself'}
    end
  end

  def destroy
    # TODO : test
    user_id = params[:id].presence.to_i

    #  check if you ask informations about yourself
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





end