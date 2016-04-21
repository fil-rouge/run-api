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
      if @group.nil?
        @group
      else
        render json: {:error => "this group name is already taken !"}
      end
    else
      render json: {:error => "you can not create a group for someone else"}
    end
  end

  def update
    #  TODO : implement
  end

  def show
    # TODO: test
    group_id = params[:id].presence.to_i
    @group = Group.find_by_id group_id
    render json:{:error => "no group with that id found."} if @group == nil
  end

  def destroy
    # TODO: implement
  end

  private

  def group_params
      params.require(:group).permit(:name, :description, :admin_id, :users, :users_id)
  end
end
