require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    subject { User.create(name: "John") }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'associations' do
    it { should have_many(:reviews) }
    it { should have_many(:authored_recipes).class_name('Recipe') }
    it { should have_many(:reviewed_recipes).through(:reviews).source(:recipe) }
  end
  
  it { should have_secure_password }

end
