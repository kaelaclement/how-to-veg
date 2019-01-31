class ReviewsController < ApplicationController
  def create
    @recipe = Recipe.find_by(id: params[:recipe_id])
    review = current_user.reviews.build(review_params)
    review.recipe = @recipe

    if review.save
      redirect_to recipe_path(review.recipe)
    else
      flash[:alert] = "Please like or comment to submit a review"
      redirect_to recipe_path(@recipe)
    end
  end

  private

    def review_params
      params.require(:review).permit(:like, :comment)
    end
end