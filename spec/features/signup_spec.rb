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

  it 'successfully signs up a valid user' do
    visit '/users/new'
    fill_in("user[name]", with: "Leah")
    fill_in("user[email]", with: "leah@howtoveg.com")
    fill_in("user[password]", with: "password")
    fill_in("user[password_confirmation]", with: "password")
    click_button('Sign Up')
    expect(current_path).to eq('/users/1')
    expect(page).to have_content("Leah")
  end
end
