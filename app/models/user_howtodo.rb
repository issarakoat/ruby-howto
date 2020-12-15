class UserHowtodo < ApplicationRecord

  belongs_to :user
  belongs_to :howtodo

  validates :user, :howtodo, presence: true

  validates_uniqueness_of :user_id, scope: :howtodo_id  #user cant see the same lesson twice for the first time
  validates_uniqueness_of :howtodo_id, scope: :user_id

end 