class ReviewsController < ApplicationController

  def new
    @recipe = Recipe.find_by(id: params[:recipe_id])
    render layout: false
  end

  def create
    @review = current_user.reviews.build(review_params)
    @review.recipe = Recipe.find_by(id: params[:recipe_id])

    if @review.save
      render json: @review
    end
  end

  private

    def review_params
      params.require(:review).permit(:like, :comment)
    end
end