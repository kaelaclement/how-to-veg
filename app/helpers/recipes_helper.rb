module RecipesHelper
  def user_recipes
    if @user
      "#{@user.name}'s Recipes"
    else
      "Browse all recipes here!"
    end
  end
end
