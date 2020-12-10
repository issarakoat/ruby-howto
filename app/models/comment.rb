class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :howtodo
  has_rich_text :content
end
