class CircuitsController < AuthenticateController
  before_action :authenticate_user_from_token!, :only => [ :create, :update, :destroy]

  def index
    # TODO:test and add route
    if params[:user_id] !=nil && @user = User.find_by_id(:user_id)
      @circuits = @user.circuits
    else
      @circuits = Circuit.all
    end
  end

  def create
     #  TODO: TEST
    users_id = params[:circuit][:users].first[:id].to_i  || nil
    users_id = params[:user_id].to_i  if !params[:user_id].blank?
    if !users_id.blank? && users_id == current_user.id

    points = []
      group_params[:points].map  do |i|
        points << Point.create(:latitude => i[:latitude], :longitude => i[:longitude])
      end

      create_params = group_params
      create_params[:points] = points
      create_params[:users] = [current_user]
      byebug
      @circuit = Circuit.create(create_params)
      if !@circuit.nil?
        @circuit
      else
        render json: ErrorsHelper.json_error(:name_already_used)
      end
    else
      render json: ErrorsHelper.json_error(:bad_user_id)
    end
  end

  def show
    # TODO: test
    @circuit = Circuit.find_by_id params[:id] || nil
    if @circuit != nil
      @circuit
    else
      render json: ErrorsHelper.json_error(:bad_id)
    end
  end

  def update
    #  TODO: test
    users_id = group_params[:users].to_i || []
    @circuit = Circuit.find_by_id group_params[:id] || nil
    if (@circuit != nil)  && (users_id.include? current_user.id)
      @circuit = Circuit.update_attributes(group_params) || nil
      if !@circuit.nil?
        @circuit
      else
        render json: ErrorsHelper.json_error(:name_already_used)
      end
    else
      render json: ErrorsHelper.json_error(:bad_user_id)
    end
  end

  def destroy
    #  TODO: test
    users_id = group_params[:users].to_i || []
    @circuit = Circuit.find_by_id group_params[:id] || nil
    if users_id.include? current_user
      # if there is only one user left, we delte the circuit
      if users_id.size <= 1
        if @circuit.destroy
          @circuit
        else
          render json: ErrorsHelper.json_error
        end
      # if there is at least 2 users, we delete only the current_user from the circuit
      else
        users_id.reject! {|user| user.id == current_user.id}
        if @circuit = Circuit.update_attributes({:users => users_id})
          @circuit
        else
          render json: ErrorsHelper.json_error
        end
      end
    else
      render json: ErrorsHelper.json_error(:bad_user_id)
    end
  end

private

  def group_params
      params.require(:circuit).permit(:id, :distance, :note, :date, :description, :time, {:users => [:id]}, :user, {:points => [:latitude, :longitude]})
  end
end
