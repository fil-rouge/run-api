class CircuitsController < ApplicationController

  def index
    # TODO:test and add route
    @circuits = Circuit.all
  end
end
