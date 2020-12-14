class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :howtodo, counter_cache: true
  #Howtodo.find_each { |howtodo| Howtodo.reset_counters(howtodo.id, :ratings) }  
    
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
