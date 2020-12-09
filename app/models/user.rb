class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable #, :confirmable
         
  rolify
  
  def to_s
    email
  end
  
  has_many :howtodos
  
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
end
