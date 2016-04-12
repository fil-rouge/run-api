class GroupsController < ApplicationController

  def index
    # TODO: test
    @groups = Group.all
  end
end
