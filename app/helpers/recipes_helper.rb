module RecipesHelper
  def user_recipes
    if @user
      "#{@user.name}'s Recipes"
    end
  end

  def edit_if_author
    if @recipe.author == current_user
      link_to "Edit this recipe", edit_user_recipe_path(@recipe.author, @recipe)
    end
  end
end
