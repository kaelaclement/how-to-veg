class Recipe < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :reviews
  has_many :users, through: :reviews
end
