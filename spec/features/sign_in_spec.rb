require "rails_helper"

feature "Sign In" do
  let(:user) { Fabricate(:user) }

  scenario "success" do
    visit sign_in_path
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button("Submit")
    expect(page).to have_content("You are now signed in")
  end
end
