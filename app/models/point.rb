class Point < ActiveRecord::Base
  # belongs_to :parcour   => old
  has_and_belongs_to_many :circuits
end
