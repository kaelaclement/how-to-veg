class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :comment, presence: { if: -> { !liked? } }
end
