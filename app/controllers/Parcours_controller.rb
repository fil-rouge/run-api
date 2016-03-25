class ParcoursController < ApplicationController
  # before_filter :authenticate_user_from_token!

  def index
    if current_user != nil
      @parcours = current_user.parcours
      render json: @parcours
    else
      render json: {"error" => "user unknown"}
    end
  end

  def new
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end

end