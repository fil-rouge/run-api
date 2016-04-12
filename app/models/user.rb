class User < ActiveRecord::Base
  before_save :set_auth_token

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # has_many :parcours  => old
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :circuits

  # validates :name,
  #           :presence => true,
  #           :length => { :maximum => 50 }

  # validates :surname,
  #           :presence => true,
  #           :length => { :maximum => 50 }

  validates :phone_number,
            :length => { :minimum => 9 },
            :uniqueness => true,
            :allow_blank => true

  validates :age,
            :numericality => { :greater_than => 0 },
            :allow_blank => true

  private
  def set_auth_token
    if self.authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

end
