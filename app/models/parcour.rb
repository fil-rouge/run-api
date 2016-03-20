class Parcour < ActiveRecord::Base
  belongs_to :user
  has_many :points
  has_many :tags

  validates :distance
            :presence => true,
            :numericality => { :greater_than => 0 },
            :length => { :maximum => 5 } # 99 KM

  validates :note
            :numericality {  #  0 < note < 5
              :greater_than_or_equal => 0 ,
              :less_than_or_equal => 5
            }

end
