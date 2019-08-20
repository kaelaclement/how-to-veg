require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    subject { User.create(name: "John") }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end
  

end
