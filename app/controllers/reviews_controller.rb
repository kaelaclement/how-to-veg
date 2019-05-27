class ReviewsController < ApplicationController

  def new
    @recipe = Recipe.find_by(id: params[:recipe_id])
    render layout: false
  end

  def create
    recipe = Recipe.find_by(id: params[:recipe_id])
    @review = current_user.reviews.create(review_params)
    render json: @review
  end

  private

    def review_params
      params.require(:review).permit(:like, :comment)
    end
end