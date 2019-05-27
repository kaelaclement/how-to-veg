class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment, :like, :created_at, :user_name
  belongs_to :user
  belongs_to :recipe

  def user_name
    object.user.name
  end

end
