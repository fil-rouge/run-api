class User < ActiveRecord::Base
  before_save :set_auth_token

  # Include default devise modules. Others available are:
  #  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#,
         # :confirmable, :lockable, :timeoutable
         # TODO uncomment and add a mailer

  has_and_belongs_to_many :groups
  has_and_belongs_to_many :circuits
  has_many :admin_groups, :class_name => "Group", :foreign_key => :admin_id

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

  #  30 minutes of delta
  VALIDATION_DELTA = 60 * 30

  def get_stats
    return {
      :circuits_number => self.circuits.size,
      :total_distance => self.circuits.inject(0){|sum,x| sum + x.distance },
      :total_time => self.circuits.inject(0){|sum,x| x.time == nil ? sum : sum + x.time}
    }
  end

  def is_token_valid?
    return false if (DateTime.now.to_time - self.previous_temporary_token_date.to_time).to_i > VALIDATION_DELTA
    true
  end

  def generate_temporary_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(temporary_token: token).first
    end
  end

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
