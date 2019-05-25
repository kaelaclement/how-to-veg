const attachListeners = () => {
  $('button#getRecipes').click(getUserRecipes);
};

function getUserRecipes() {
  $('div#userRecipes').html('');
  const userId = $('button#getRecipes').attr('data-user-id');
  $.getJSON(`/users/${userId}/recipes`, function(data) {
    data.forEach(r => {
      let recipe = new Recipe(r)
      let recipeHtml = recipe.recipeLinkHtml()
      $('div#userRecipes').append(recipeHtml)
    });
  });
};

class Recipe {
  constructor(recipe) {
    this.id = recipe.id;
    this.title = recipe.title;
    this.ingredients = recipe.ingredients.split(', ');
    this.instructions = recipe.instructions;
  };

  recipeLinkHtml() {
    return `<p><a data-recipe-id="${this.id}" href=#>${this.title}</a></p>`;
  };

  ingredientsListHtml() {
    let ingredientsHtml = this.ingredients.map(i => {return `<li>${i}</li>`});
    let listHtml = `<ul>${ingredientsHtml}</ul>`;
    return listHtml;
  };

  recipeShowHtml() {
    let recipeHtml = `
    <h1>${this.title}</h1>
    ${this.ingredientsListHtml()}
    <p>${this.instructions}</p>
    `
    return recipeHtml;
  };
};

$(function() {
  attachListeners();
});