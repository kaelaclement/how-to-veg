class RecipesController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @recipes = @user.authored_recipes      
    else
      @recipes = Recipe.ordered_by_most_recent
    end
  end
end
