require 'rails_helper'
require 'capybara/rails'

feature 'Auth' do

  scenario 'Users can login and out' do
    create_user email: "user@example.com", password:"password"

    visit root_path
    within(".signin-form") { click_on "Login" }
    expect(page).to have_content("Username / password is invalid")

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    within(".signin-form") { click_on "Login" }
    expect(page).to have_content("Welcome user@example.com")
    click_on "Logout"
    expect(page).to have_content("Login")
    click_on "Register"
    fill_in "Name", with: "Adam"
    fill_in "Email", with: "adam@example.com"
    fill_in "Password", with: "password"
    fill_in "Confirm", with: "password"
    within(".registration-form") do
      click_on("Register")
    end
    expect(page).to have_content("Welcome adam@example.com")
    click_on "Logout"
    expect(page).to have_content("Login")
    


  end

end
