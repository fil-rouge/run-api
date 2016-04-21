class CircuitsController < AuthenticateController
  before_action :authenticate_user_from_token!, :only => [ :create, :update, :destroy]

  def index
    # TODO:test and add route
    @circuits = Circuit.all
  end

  def create
     #  TODO: TEST
    users_id = group_params[:users].to_i || []
    if users_id.empty?  && users_id.first == current_user.id
      @circuit = Circuit.create(group_params)
      if !@circuit.nil?
        @circuit
      else
        render json: {:error => "this circuit name is already taken !"}
      end
    else
      render json: {:error => "you can not create a circuit for someone else"}
    end
  end

  def show
    # TODO: test
    @circuit = Circuit.find_by_id group_params[:id] || nil
    if @circuit != nil
      @circuit
    else
      render json: {:error => "circuit not found with that id"}
    end
  end

  def update
    #  TODO: test
    users_id = group_params[:users].to_i || []
    @circuit = Circuit.find_by_id group_params[:id] || nil
    if @circuit != nil  && users_id.include? current_user.id
      @circuit = Circuit.update_attributes(group_params) || nil
      if !@circuit.nil?
        @circuit
      else
        render json: {:error => "this circuit name is already taken !"}
      end
    else
      render json: {:error => "you can not create a circuit for someone else"}
    end
  end

  def destroy
    #  TODO: test
    users_id = group_params[:users].to_i || []
    @circuit = Circuit.find_by_id group_params[:id] || nil
    if users_id.include? current_user
      # if there is only one user left, we delte the circuit
      if users_id.size <= 1

      # if there is at least 2 users, we delete only the current_user from the circuit
      else
        users_id.reject! {|user| user.id == current_user.id}
        if @circuit = Circuit.update_attributes({:users => users_id})
          @circuit
        else
          render json: {:error => "unknown error when circuit#destroy"}
      end
    else
          render json: {:error => "you can not destroy a circuit that is not your"}
    end
  end

private

  def group_params
      params.require(:group).permit(:id, :distance, :note, :date, :description, :time, :users)
  end
end
