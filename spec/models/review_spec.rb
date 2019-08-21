require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:recipe) }
  end

  describe 'validations' do
    context 'if not liked' do
      subject { Review.new(like: 0) }
      it { should validate_presence_of(:comment) }
    end
  end
end
