class ReviewsController < ApplicationController
  def create
    
  end

  private

    def reivew_params
      params.require(:review).permit(:like, :comment)
    end
end