# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
kaela = User.create(name: "Kaela", email: "kaela@howtoveg.com", password: "test")
lorna = User.create(name: "Lorna", email: "lorna@howtoveg.com", password: "test")
rhiannon = User.create(name: "Rhiannon", email: "rhiannon@howtoveg.com", password: "test")

kaelas_recipe = Recipe.create(author: kaela, title: "shakshouka", ingredients: "shakshouka stuff", instructions: "make it")
kaelas_recipe2 = Recipe.create(author: kaela, title: "philly not-cheesesteak", ingredients: "1 green bell pepper, 1 portobello mushroom, 2 cloves garlic, 1 T butter, 1/2 onion, cheese and bread of choice", instructions: "sautee veggies and add cheese.")
lornas_recipe = Recipe.create(author: lorna, title: "bagel", ingredients: "bagel, cream cheese", instructions: "toast the bagel maybe. put on the cream cheese")

Review.create(user: kaela, recipe: lornas_recipe, comment: "did we need a recipe?")
Review.create(user: lorna, recipe: kaelas_recipe, like: 1, comment: "i love this stuff!")
Review.create(user: lorna, recipe: kaelas_recipe2, like: 1)
Review.create(user: rhiannon, recipe: kaelas_recipe2, like: 1, comment: "i make this all the time!!")
