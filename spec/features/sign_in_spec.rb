require "rails_helper"

feature "Sign In" do
  let(:user) { Fabricate(:user) }

  scenario "success" do
    visit sign_in_path
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_button("Submit")
    expect(page).to have_content("You are now signed in")
  end
end
