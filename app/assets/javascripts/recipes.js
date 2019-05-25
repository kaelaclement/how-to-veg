const attachListeners = () => {
  $('button#getRecipes').click(getUserRecipes);
};

function getUserRecipes() {
  $('div#userRecipes').html('');
  const userId = $('button#getRecipes').attr('data-user-id');
  $.getJSON(`/users/${userId}/recipes`, function(data) {
    data.forEach(r => {
      let recipe = new Recipe(r)
      let recipeHtml = recipe.recipeLink()
      $('div#userRecipes').append(recipeHtml)
    });
  });
};

class Recipe {
  constructor(recipe) {
    this.title = recipe.title;
    this.ingredients = recipe.ingredients.split(', ');
    this.instructions = recipe.instructions;
  };

  recipeLink() {
    return `<p><a href=#>${this.title}</a></p>`;
  };

  ingredientsList() {
    
  };

  recipeShow() {
    
  };
};

$(function() {
  attachListeners();
});