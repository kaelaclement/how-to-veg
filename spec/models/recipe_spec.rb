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

end
