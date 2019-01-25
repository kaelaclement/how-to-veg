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
    @user = User.find_by(id: params[:user_id])
    @recipe = @user.authored_recipes.build(recipe_params)
    if @recipe.save
      redirect_to user_recipe_path(@user, @recipe)
    else
      flash[:alert] = "Please fill out all fields"
      render :new
    end
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    if @user == current_user
      @recipe = @user.authored_recipes.find_by(id: params[:id])
    else
      @recipe = Recipe.find_by(id: params[:id])
      redirect_to user_recipe_path(@user, @recipe)
    end
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.update(recipe_params)
    redirect_to user_recipe_path(@recipe.author, @recipe)
  end

  def destroy
    @user = User.find_by(id: params[:user_id])
    @user.authored_recipes.find_by(id: params[:id]).delete
    redirect_to user_recipes_path(@user)
  end

  private

    def recipe_params
      params.require(:recipe).permit(:title, :ingredients, :instructions)
    end
end
