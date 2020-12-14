class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :howtodo
    
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
    
  after_save do
    unless rate.nil? || rate.zero?
      howtodo.update_rating
    end
  end

  after_destroy do
    howtodo.update_rating
  end
end
