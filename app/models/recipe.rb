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
end
