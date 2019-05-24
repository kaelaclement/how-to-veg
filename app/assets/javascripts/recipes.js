const attachListeners = () => {
  $('button#getRecipes').click(getUserRecipes);
};

function getUserRecipes() {
  const userId = $('button#getRecipes').attr('data-user-id');
  $.get(`/users/${userId}/recipes`, function(data) {
    console.log(data);
  });
};

$(function() {
  attachListeners();
});