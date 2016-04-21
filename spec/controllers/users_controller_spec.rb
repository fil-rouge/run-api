require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  #======================== INDEX ===========================
  describe "index" do
    before do
      # TODO: use factorygirl her
    end

    it "get a well form response" do
      @user = get :index
      expect false
    end

    it "get all the users" do
      @user = get :index
      expect false
    end
  end

  #======================== SHOW ===========================
  describe "show" do
    before do
      # TODO: use factorygirl her
    end

    it "show a user with incorrect id" do
      @user = get :show
      expect false
    end

    it "show a user with correct id" do
      @user = get :show
      expect false
    end
  end

  #======================== UPDATE ===========================
  describe "index" do
    before do
      # TODO: use factorygirl her
    end

    it "Update a user as a user" do
      @user = get :update
      expect false
    end
  end

  #======================== DESTROY ===========================
  describe "index" do
    before do
      # TODO: use factorygirl her
    end

    it "destroy a user as an user" do
      @user = get :destroy
      expect false
    end
  end
end
