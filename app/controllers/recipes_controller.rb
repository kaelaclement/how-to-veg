class RecipesController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @recipes = @user.authored_recipes      
    else
      @recipes = Recipe.all
    end
  end
end
