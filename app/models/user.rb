class User < ApplicationRecord
  has_secure_password

  has_many :authored_recipes, class_name: "Recipe", foreign_key: "author_id"
  has_many :reviews
  has_many :reviewed_recipes, through: :reviews, source: :recipe

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true
end
