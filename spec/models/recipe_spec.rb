require 'rails_helper'

RSpec.describe Recipe, type: :model do
  
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:ingredients) }
    it { should validate_presence_of(:instructions) }
  end

  describe 'associations' do
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:reviews) }
    it { should have_many(:users).through(:reviews) }
  end

  it "can search for recipes by title" do
    @user = User.create(name: "Kate", email: "kate@veggie.com", password: "password")
    @recipe_one = Recipe.create(title: "Avocado Toast", ingredients: "bread of choice, butter, 1/2 an avocado, lime juice, salt and pepper to taste", instructions: "Toast your bread, spread with butter, mash avocado and apply half to each slice of bread. sprinkle with lime juice, salt, and pepper. Enjoy!", author: user)
    @recipe_two = Recipe.create(title: "Something Else", ingredients: "other ingredients", instructions: "Make it.", author: user)

    expect(Recipe.find_in_title("avocado").first.title).to eq(@recipe_one.title)
  end

end
