class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :howtodo
    
  after_save do
    unless rate.nil? || rate.zero?
      howtodo.update_rating
    end
  end

  after_destroy do
    howtodo.update_rating
  end
end
