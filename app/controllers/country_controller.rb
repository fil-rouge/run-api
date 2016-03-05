class CountryController < ApplicationController


  def index
    @countries = Country.all || []
    render json: @countries
  end

  def new
    @country = Country.new
  end

  def create
    @country = Record.new(country_params)
      if @country.save
        render json: @country
      else
        render json: @country.errors, status: :unprocessable_entity
      end

  end

  def show
  end


  private

  def record_params
      params.require(:country).permit(:name)
  end
end
