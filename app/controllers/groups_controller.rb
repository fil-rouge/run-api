class GroupsController < ApplicationController

  def index
    # TODO: test
    @groups = Group.all
    render json: {:data => @groups}
  end
end
