class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :howtodo
  validates :content, presence: true
  has_rich_text :content
end
