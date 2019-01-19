# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
kaela = User.create(email: "kaela@howtoveg.com", password: "test")
lorna = User.create(email: "lorna@howtoveg.com", password: "test")

kaelas_recipe = Recipe.create(author: kaela, title: "shakshouka", ingredients: "shakshouka stuff", instructions: "make it")
lornas_recipe = Recipe.create(author: lorna, title: "bagel", ingredients: "bagel, cream cheese", instructions: "toast the bagel maybe. put on the cream cheese")

Review.create(user: kaela, recipe: lornas_recipe, liked?: false, comment: "did we need a recipe?")
Review.create(user: lorna, recipe: kaelas_recipe, liked?: true, comment: "i love this stuff!")