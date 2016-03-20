class Tag < ActiveRecord::Base
  belongs_to :parcour

  validates :value
            :presence => true,
            :length => { :maximum => 50 },
            :uniqueness => true
end
