class GroupsController < AuthenticateController
  before_action :authenticate_user_from_token!, :only => [ :create, :update, :destroy]

  def index
    # TODO: test
    @groups = Group.all
  end

  def create
    #  TODO: TEST
    params = group_params
    admin_id = params[:admin_id].to_i || nil
    if admin_id != nil  && admin_id == current_user.id
      @group = Group.create(params)
      if !@group.nil?
        @group
      else
        render json: {:error => "this group name is already taken !"}
      end
    else
      render json: {:error => "you can not create a group for someone else"}
    end
  end

  def update
    #  TODO : test & refacto
    params = group_params
    @group = Group.find_by_id(params[:id]) || nil
    if  @group !=nil
      # The admin is updating his group
      if @group.admin.id == current_user.id
        if @group.update_attributes(params)
          @group
        else
          render json: {:error => "unkown error"}
        end
      #  someone else wants to update the group
      else
        users = params[:users] || params[:users_id] || nil
        if users != nil
          if (users - @groups.users).first.id == current_user.id
            # on ajout le user au groupe
            if @group.update_attibutes({:users => users})
              @group
            else
              render json: {:error => "unkown error"}
            end

          elsif (@groups.users - users).first.id == current_user.id
            # on supprimee le user du groupe
            if @group.update_attibutes({:users => users})
              @group
            else
              render json: {:error => "can update attributes"}
            end
          else
            render json: {:error => "you can not update other user from the group"}
          end
        end
      end
    else
      render json: {:error => "this group does not exist"}
    end
  end

  def show
    # TODO: test
    group_id = params[:id].presence.to_i
    @group = Group.find_by_id group_id
    render json:{:error => "no group with that id found."} if @group == nil
  end

  def destroy
    # TODO: implement and test
    params = group_params
    @group = Group.find_by_id params[:id] || nil
    if @group != nil && @group.admin.id == current_user.id
      if @group.destroy
        @group
      else
        render json: {:error => " we can not destroy this group"}
      end
    else
      render json: {:error => "you can destroy a group if you re not the admin"}
    end
  end

  private

  def group_params
      params.require(:group).permit(:id, :name, :description, :admin_id, :admin, :users, :users_id)
  end
end
