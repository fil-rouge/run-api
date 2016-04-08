class GroupsController < ApplicationController

  def index
    # TODO: test and add route
    @groups = Group.all
    render json: {:data => @groups}
  end
end
