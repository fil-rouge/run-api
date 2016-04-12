class GroupsController < ApplicationController

  def index
    # TODO: test
    @groups = Group.all
  end

  def show
    group_id = params[:id].presence.to_i
    @group = Group.find_by_id group_id
    render json:{:error => "no group with that id found."} if @group == nil
  end
end
