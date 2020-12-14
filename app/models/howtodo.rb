class Howtodo < ApplicationRecord
    validates :title,  presence: true, uniqueness: true
    validates :description, presence: true, length: { :minimum => 5 }
    def to_s
        title
    end
    has_rich_text :description
    
    belongs_to :user, counter_cache: true
    #User.find_each { |user| User.reset_counters(user.id, :howtodos) }  
    has_many :comments, dependent: :destroy
    has_many :ratings, dependent: :destroy
    
    extend FriendlyId
    friendly_id :title, use: :slugged
    
    include PublicActivity::Model
    tracked owner: Proc.new{ |controller, model| controller.current_user }
    
    def update_rating
        if ratings.any? && ratings.where.not(rate: nil).any?
          update_column :average_rating, (ratings.average(:rate).round(2).to_f)
        else
          update_column :average_rating, (0)
        end
    end
end
