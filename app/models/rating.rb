class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :howtodo
  scope :pending_rating, -> { where(rate: [0, nil, ""]) }
end
