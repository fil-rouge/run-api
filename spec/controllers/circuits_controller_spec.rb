require 'rails_helper'

RSpec.describe CircuitsController, type: :controller do

  #======================== INDEX ===========================
  describe "index" do
    before do
      # TODO: use factorygirl her
    end

    it "get a well form  response" do
      @circuit = get :index
      expect false
    end

    it "get all the circuits" do
      @circuit = get :index
      expect false
    end
  end

  #======================== SHOW ===========================
  describe "show" do
    before do
      # TODO: use factorygirl her
    end

    it "show a circuit with incorrect id" do
      @circuit = get :show
      expect false
    end

    it "show a circuit with correct id" do
      @circuit = get :show
      expect false
    end
  end

  #======================== UPDATE ===========================
  describe "index" do
    before do
      # TODO: use factorygirl her
    end

    it "Uupdate a circuit as an admin" do
      @circuit = get :update
      expect false
    end

    it "Update a circuit as a user" do
      @circuit = get :update
      expect false
    end
  end

  #======================== DESTROY ===========================
  describe "index" do
    before do
      # TODO: use factorygirl her
    end

    it "Destroy a circuit as an admin" do
      @circuit = get :destroy
      expect false
    end

    it "destroy a circuit as an user" do
      @circuit = get :destroy
      expect false
    end
  end
end
