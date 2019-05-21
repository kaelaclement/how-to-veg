class RecipesController < ApplicationController
  before_action :get_user, only: [:new, :create, :edit, :destroy]

  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if @user
        @recipes = @user.authored_recipes.ordered_by_most_recent
      else
        redirect_to root_path
      end
    elsif params[:search]
      @recipes = Recipe.find_in_title(params[:search])
    elsif params[:order] == "popular"
      @recipes = Recipe.ordered_by_likes
      @button = "recent"
    else
      @button = "popular"
      @recipes = Recipe.ordered_by_most_recent
    end
    render json: @recipes
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    @ingredients = @recipe.ingredients.split(",")

    render json: @recipe
  end

  def new
    if !@user
      redirect_to root_path
    elsif @user != current_user
      redirect_to user_path(@user)
    else
      @recipe = Recipe.new
    end
  end

  def create
    if @user == current_user
      @recipe = @user.authored_recipes.build(recipe_params)
      if @recipe.save
        redirect_to user_recipe_path(@user, @recipe)
      else
        render :new
      end
    else
      redirect_to root_path
    end
  end

  def edit
    if !@user
      redirect_to root_path
    elsif @user == current_user
      @recipe = @user.authored_recipes.find_by(id: params[:id])
    else
      @recipe = Recipe.find_by(id: params[:id])
      redirect_to user_recipe_path(@user, @recipe)
    end
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    if @recipe.update(recipe_params)
      redirect_to user_recipe_path(@recipe.author, @recipe)
    else
      @user = @recipe.author
      render :edit
    end
  end

  def destroy
    if @user == current_user
      @user.authored_recipes.find_by(id: params[:id]).delete
      redirect_to user_recipes_path(@user)
    else
      redirect_to root_path
    end
  end

  private

    def recipe_params
      params.require(:recipe).permit(:title, :ingredients, :instructions)
    end

    def get_user
      @user = User.find_by(id: params[:user_id])
    end
end
