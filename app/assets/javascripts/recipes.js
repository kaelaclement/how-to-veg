class Recipe {
  constructor(recipe) {
    this.id = recipe.id;
    this.title = recipe.title;
    this.ingredients = recipe.ingredients.split(', ');
    this.instructions = recipe.instructions;
    this.reviews = recipe.reviews.reverse();
  }
  
  recipeLinkHtml() {
    return `<p><a id="recipeLink" data-recipe-id="${this.id}" href="/recipes/${this.id}">${this.title}</a></p>`;
  }
  
  recipeShowHtml() {
    let recipeHtml = `
    <h1 id="recipe" data-recipe-id="${this.id}">${this.title}</h1>
    <ul>`

    this.ingredients.forEach(i => {recipeHtml += `<li>${i}</li>`})

    recipeHtml += `</ul>
    <p>${this.instructions}</p>
    `
    return recipeHtml;
  }

  reviewsHtml() {
    $('h3#reviewsHeadline').html('Reviews')
    let reviewsHtml = '';
    this.reviews.forEach(review => {
      if(review.comment) {
        reviewsHtml += 
        `<p>By: ${review.user_name}</p>
        <p>Comment: ${review.comment}</p>`
      }
    });
    return reviewsHtml;
  }
}

const getUserRecipes = () => {
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

const alphabetizeUserRecipes = () => {
  $('div#userRecipes').html('');
  const userId = $('button#alphabetizedRecipes').attr('data-user-id');
  $.getJSON(`/users/${userId}/recipes`, function(data) {
    data.sort(function(a,b){
      let title1 = a.title.toLowerCase();
      let title2 = b.title.toLowerCase();
      if(title1 < title2) {
          return -1;
      } else if(title2 > title1) {
          return 1;
      } else {
          return 0;
      }
  })
    data.forEach(r => {
      let recipe = new Recipe(r)
      let recipeHtml = recipe.recipeLinkHtml()
      $('div#userRecipes').append(recipeHtml)
    });
  });
}

const newReviewHtml = review => {
  if(review.comment) {
    return `
    <p>By: ${review.user_name}</p>
    <p>Comment: ${review.comment}</p>
    `
  }
};

$(function() {
  $('button#getRecipes').click(getUserRecipes);

  $('button#alphabetizedRecipes').click(alphabetizeUserRecipes);

  $(document).on('click', 'a#recipeLink', function(e) {
    e.preventDefault();
    $('div#userRecipe').html('');
    $('div#recipeReviews').html('');
    $('div#newReview').html('');
    $.getJSON(e.currentTarget.href, function(data) {
      let recipe = new Recipe(data);
      $('div#userRecipe').append(recipe.recipeShowHtml());
      $('div#newReview').append(`<button id="newReview">Leave A Review</button>`);
      $('div#recipeReviews').append(recipe.reviewsHtml());
    });
  });

  $(document).on('click', 'button#newReview', function(e) {
    $('div#newReview').html('');
    let recipeId = $('h1#recipe').attr('data-recipe-id');
    $.get(`/recipes/${recipeId}/reviews/new`, function(data) {
      $('div#newReview').append(data);
    });
  });

  $(document).on('submit', 'form#reviewForm', function(e){
    e.preventDefault();
    const reviewParams = $(this).serialize();
    const postURL = this.action
    // const postURL = $(this)[0]["action"]
    $.post(postURL, reviewParams)
    .done(function(data) {
      $('div#newReview').html('<h5>Review Posted!</h5>');
      $('div#recipeReviews').prepend(newReviewHtml(data));
    })
  });
});