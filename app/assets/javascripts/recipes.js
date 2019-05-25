const attachListeners = () => {
  $('button#getRecipes').click(getUserRecipes);
};

function getUserRecipes() {
  $('div#userRecipes').html('');
  const userId = $('button#getRecipes').attr('data-user-id');
  $.getJSON(`/users/${userId}/recipes`, function(data) {
    data.forEach(r => {
      let recipe = new Recipe(r.title)
      let recipeHtml = recipe.recipeLink()
      $('div#userRecipes').append(recipeHtml)
    });
  });
};

class Recipe {
  constructor(title) {
    this.title = title;
  };

  recipeLink() {
    return `<p><a href=#>${this.title}</a></p>`
  };
};

$(function() {
  attachListeners();
});