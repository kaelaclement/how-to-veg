class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :comment, presence: { if: -> { like.blank? || like == 0 } }
  validates :like, inclusion: { in: [1, 0] }
end
