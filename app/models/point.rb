class Point < ActiveRecord::Base
  has_and_belongs_to_many :circuits

  validates :latitude,
            :presence => true

  validates :longitude,
            :presence => true
end
