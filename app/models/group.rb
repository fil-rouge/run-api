class Group < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates :name,
            :presence => true,
            :uniqueness => true,
            :length => { :maximum => 50 }

  validates :description,
            :presence => true,
            :length => { :maximum => 1000 }


end
