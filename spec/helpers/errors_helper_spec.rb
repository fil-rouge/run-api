require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the CircuitsHelper. For example:
#
# describe CircuitsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe CircuitsHelper, type: :helper do

  describe "json_error" do
    before do
      @default_response = { :error => "An unknown error has occured" }
      @invalid_token_response = {:error => "Invalid authorization: your token is not valid "}
      @invalid_header_response = {:error => "Invalid authorization: you need to give the user id and the authenthification token in the header as HTTP_USER_ID and HTTP_TOKEN"}
      @unknown_error_response = {:error => "An unknown error has occured"}
      @name_already_used_response = {:error => "this name is already taken !"}
      @bad_user_id_response = {:error => "you can not make that action for an other user"}
      @bad_id_response = {:error => "not found with that ID"}
      @not_admin_response = {:error => "This action in forbiden because you're not admin"}
    end

    it "get an unknown error by default" do
      rep = ErrorsHelper.json_error
      expect(rep).to eq(@default_response)
    end

    it "get an @invalid_token_response" do
      rep = ErrorsHelper.json_error
      expect(rep).to eq(@default_response)
    end

    it "get an @invalid_header_response" do
      rep = ErrorsHelper.json_error(:invalid_token)
      expect(rep).to eq(@invalid_token_response)
    end

    it "get an @unknown_error_response" do
      rep = ErrorsHelper.json_error(:unknown_error)
      expect(rep).to eq(@unknown_error_response)
    end

    it "get an @name_already_used_response" do
      rep = ErrorsHelper.json_error(:name_already_used)
      expect(rep).to eq(@name_already_used_response)
    end

    it "get an @bad_user_id_response" do
      rep = ErrorsHelper.json_error(:bad_user_id)
      expect(rep).to eq(@bad_user_id_response)
    end

    it "get an @bad_id_response" do
      rep = ErrorsHelper.json_error(:bad_id)
      expect(rep).to eq(@bad_id_response)
    end

    it "get an @not_admin_response" do
      rep = ErrorsHelper.json_error(:not_admin)
      expect(rep).to eq(@not_admin_response)
    end

    it "get an error when the synbol provided is unknown" do
      rep = ErrorsHelper.json_error(:symbolUnknown32313)
      expect(rep).to eq(@default_response)
    end


  end
end
