class RecipesController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @recipes = @user.authored_recipes.ordered_by_most_recent     
    elsif params[:search] == "popular"
      @recipes = Recipe.ordered_by_likes
    else
      @recipes = Recipe.ordered_by_most_recent
    end
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    @ingredients = @recipe.ingredients.split(",")
  end

  def new
    @user = User.find_by(id: params[:user_id])
    if !logged_in? || current_user != @user
      redirect_to user_path(@user)
    end
  end

  def create
  end
end
