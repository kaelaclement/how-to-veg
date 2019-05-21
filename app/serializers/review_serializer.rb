class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment, :like, :created_at, :user_id
  belongs_to :user
  belongs_to :recipe
end
