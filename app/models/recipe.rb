class Recipe < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :reviews
  has_many :users, through: :reviews

  validates :title, presence: true
  validates :ingredients, presence: true
  validates :instructions, presence: true

  def self.ordered_by_likes
    most_liked = []
    Review.most_liked_hash.each do |recipe, likes|
      most_liked.unshift(Recipe.find(recipe))
    end
    most_liked  
  end

  def self.ordered_by_most_recent
    order(created_at: :desc)
  end

  def total_likes
    Review.where(recipe_id: id).sum(:like)
  end

  def self.user_liked_recipes(user)
    Review.user_liked_reviews(user).map do |review|
      Recipe.where(id: review.recipe_id)
    end
  end

  def self.find_in_title(search)
    Recipe.where("title LIKE ?", "%#{search}%")
  end
end
