require 'rails_helper'

RSpec.describe GroupsController, type: :controller do

#======================== INDEX ===========================
  describe "index" do
    before do
      # TODO: use factorygirl her
    end

    it "get a well form  response" do
      @group = get :index
      expect false
    end

    it "get all the groups" do
      @group = get :index
      expect false
    end
  end

  #======================== SHOW ===========================
  describe "show" do
    before do
      # TODO: use factorygirl her
    end

    it "show a group with incorrect id" do
      @group = get :show
      expect false
    end

    it "show a group with correct id" do
      @group = get :show
      expect false
    end
  end

  #======================== UPDATE ===========================
  describe "index" do
    before do
      # TODO: use factorygirl her
    end

    it "Uupdate a group as an admin" do
      @group = get :update
      expect false
    end

    it "Update a group as a user" do
      @group = get :update
      expect false
    end
  end

  #======================== DESTROY ===========================
  describe "index" do
    before do
      # TODO: use factorygirl her
    end

    it "Destroy a group as an admin" do
      @group = get :destroy
      expect false
    end

    it "destroy a group as an user" do
      @group = get :destroy
      expect false
    end
  end

end
