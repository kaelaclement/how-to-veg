class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :ingredients, :instructions, :created_at
  belongs_to :author
  has_many :reviews
  has_many :users, through: :reviews
end
