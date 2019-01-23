class ReviewsController < ApplicationController
  def create
    review = Review.new(review_params)
    @recipe = Recipe.find_by(id: params[:recipe_id])
    review.user = current_user
    review.recipe = @recipe

    if review.save
      redirect_to recipe_path(review.recipe)
    else
      flash[:alert] = "Please like or comment to submit a review"
      redirect_to recipe_path(@recipe)
    end
  end

  def index
    @user = User.find_by(id: params[:user_id])
    @reviews = @user.reviews
  end

  private

    def review_params
      params.require(:review).permit(:like, :comment)
    end
end