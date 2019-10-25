require 'rails_helper'

RSpec.feature "SignUp", type: :feature do
  it 'asks for user name and email' do
    visit '/users/new'
    expect(page).to have_content("Name")
    expect(page).to have_content("Email")
  end

  it 'gets password confirmation' do
    visit '/users/new'
    expect(page).to have_content("Password")
    expect(page).to have_content("Password confirmation")
  end
end
