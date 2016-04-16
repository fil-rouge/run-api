class Circuit < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :points

  validates :distance,
            :numericality => { :greater_than_or_equal_to => 0 },
            :presence => true

  validates :note,
            :numericality => {
              :greater_than_or_equal_to => 0,
              :lesser_than_or_equal_to => 5
            },
            :presence => true

  validates :description,
            :length => { :maximum => 1000 }
end
