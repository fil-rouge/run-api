require 'rails_helper'

RSpec.describe GroupsController, type: :controller do

  describe "index" do
    before do
      # TODO: use factorygirl her

    end

    it "get a well form  response" do
      @group = get :index
      expect 1 == 2
    end

    it "get all the groups" do
      @group = get :index
      expect 1 == 2
    end

end
