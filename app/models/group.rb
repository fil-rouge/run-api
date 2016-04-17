class Group < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :admin, :class_name => "User", :foreign_key => :admin_id

  validates :name,
            :presence => true,
            :uniqueness => true,
            :length => { :maximum => 50 }

  validates :description,
            :presence => true,
            :length => { :maximum => 1000 }
  validates :admin,
            :presence => true


end
