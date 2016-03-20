require 'rails_helper'
RSpec.describe CountryController, type: :controller do
  describe "#index" do
    let(:france) {Country.create(name: 'France')}
    let(:espagne) {Country.create(name: 'Espagne')}

    it "should gets index" do

    end
  end
end
