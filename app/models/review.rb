class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :comment, presence: { if: -> { like.blank? || like == 0 } }
  validates :like, inclusion: { in: [1, 0] }

  def self.most_liked_hash
    group(:recipe_id).order(:like).sum(:like)
  end

  def self.user_liked_reviews(user)
    where(user_id: user.id, like: 1)
  end
end
