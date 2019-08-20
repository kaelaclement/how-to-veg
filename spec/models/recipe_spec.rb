require 'rails_helper'

RSpec.describe Recipe, type: :model do
  
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:ingredients) }
    it { should validate_presence_of(:instructions) }
  end

end
