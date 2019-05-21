class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment, :like, :created_at, :user_id
end
