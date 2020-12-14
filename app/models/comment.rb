class Comment < ApplicationRecord
  belongs_to :user, counter_cache: true
  #User.find_each { |user| User.reset_counters(user.id, :comments) }  
  belongs_to :howtodo, counter_cache: true
  #Howtodo.find_each { |howtodo| Howtodo.reset_counters(howtodo.id, :comments) }  
  validates :content, presence: true
  has_rich_text :content
  
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

end
