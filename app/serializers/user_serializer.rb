class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :reviews
  has_many :reviewed_recipes, through: :reviews
end
