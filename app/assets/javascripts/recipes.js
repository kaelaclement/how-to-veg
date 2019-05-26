class Recipe {
  constructor(recipe) {
    this.id = recipe.id;
    this.title = recipe.title;
    this.ingredients = recipe.ingredients.split(', ');
    this.instructions = recipe.instructions;
  };
  
  recipeLinkHtml() {
    return `<p><a id="recipeLink" data-recipe-id="${this.id}" href="/recipes/${this.id}">${this.title}</a></p>`;
  };
  
  recipeShowHtml() {
    let recipeHtml = `
    <h1>${this.title}</h1>
    <ul>`

    this.ingredients.forEach(i => {recipeHtml += `<li>${i}</li>`})

    recipeHtml += `</ul>
    <p>${this.instructions}</p>
    `
    return recipeHtml;
  };
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

$(function() {
  $('button#getRecipes').click(getUserRecipes);

  $(document).on('click', 'a#recipeLink', function(e) {
    e.preventDefault();
    $('div#userRecipe').html('');
    $.getJSON(e.currentTarget.href, function(data) {
      let recipe = new Recipe(data);
      $('div#userRecipe').append(recipe.recipeShowHtml());
    });
  });
});