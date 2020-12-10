class Howtodo < ApplicationRecord
    validates :title,  presence: true
    validates :description, presence: true, length: { :minimum => 5 }
    def to_s
        title
    end
    has_rich_text :description
    
    belongs_to :user
    has_many :comments, dependent: :destroy
    
    extend FriendlyId
    friendly_id :title, use: :slugged
    
    include PublicActivity::Model
    tracked owner: Proc.new{ |controller, model| controller.current_user }
end
