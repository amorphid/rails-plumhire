require "rails_helper"

feature "Sign In" do
  scenario "success" do
    sign_in(Fabricate(:user))
    expect(page).to have_content("You are now signed in")
  end
end
