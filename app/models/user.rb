class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable #, :confirmable
         
  rolify
  
  def to_s
    email
  end
  
  def view_howtodo(howtodo)
    unless self.user_howtodos.where(howtodo: howtodo).any?
      self.user_howtodos.create(howtodo: howtodo)
    end
  end
  
  def username
    self.email.split(/@/).first
  end
  
  has_many :howtodos, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :ratings, dependent: :nullify
  has_many :user_howtodos
  
  extend FriendlyId
  friendly_id :email, use: :slugged
  
  after_create :assign_default_role

  def assign_default_role
    if User.count == 1
      self.add_role(:super) if self.roles.blank?
      self.add_role(:admin)
      self.add_role(:visitor)
    else
      self.add_role(:visitor) if self.roles.blank?
    end
  end
  
  validate :must_have_a_role, on: :update
  
  def online?
    updated_at > 2.minutes.ago
  end


  private
  def must_have_a_role
    unless roles.any?
      errors.add(:roles, "must have at least one role")
    end
  end

end
