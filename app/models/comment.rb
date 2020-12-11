class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :howtodo
  validates :content, presence: true
  has_rich_text :content
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  def to_s
    content
  end
end
