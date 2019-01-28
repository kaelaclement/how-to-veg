# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
     - User has_many authored_recipes
     - User has_many reviews
     - Recipe has_many reviews
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
     - Recipe belongs_to User
     - Review belongs_to User
     - Review belongs_to Recipe
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
     - User has_many reviewed_recipes through reviews
     - Recipe has_many users through reviews
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
     - User has_many reviewed_recipes through reviews
     - Recipe has_many users through reviews
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
     - Reviews have liked? and comment attributes
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
     - User has name, appropriately formatted email, and password (with password confirmation)
     - Recipe has title, ingredients list, and instructions
     - Reviews have a like, a comment, or both
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
     - Sort recipes by most popular or most recent
- [x] Include signup (how e.g. Devise)
     - /users/new, users#create
- [x] Include login (how e.g. Devise)
     - /login, session#new
- [x] Include logout (how e.g. Devise)
     - POST /logout, session#destroy
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
     - can sign up/log in with Facebook through OmniAuth
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
     - users/1/recipes
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
     - users/1/recipes/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
     - /users/new
     - /users/1/recipes/new
     - /users/1/recipes/edit

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate