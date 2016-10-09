require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign up"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'Username', :with => "testing_username"
      fill_in 'Password', :with => "biscuits"
      click_button "Submit"
    end

    scenario "redirects to subs index page after signup" do
      expect(page).to have_content "Subreddits"
    end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content "testing_username"
    end
  end

  feature "with an invalid user" do
    before(:each) do
      visit new_user_url
      fill_in 'Username', :with => "testing_username"
      click_button "Submit"
    end

    scenario "re-renders the signup page if an invalid user is given" do
      expect(page).to have_content('Sign up')
    end
  end

end
