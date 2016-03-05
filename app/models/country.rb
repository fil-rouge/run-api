class Country < ActiveRecord::Base

  def to_builder
    Jbuilder.new do |country|
      country.name
    end
  end
end
