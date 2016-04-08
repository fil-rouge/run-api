class Point < ActiveRecord::Base
  belongs_to :parcour
  has_many :circuits
end
