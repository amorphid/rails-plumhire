require "rails_helper"

feature "Sign up" do
  let(:user) { Fabricate.build(:user) }
  let(:password) { user.password }

  scenario "success" do
    visit sign_up_path
    fill_in "user_email", with: user.email
    fill_in "user_password", with: password
    click_button("Submit")
    expect(page).to have_content("Email sent to #{user.email}")
    open_email(user.email)
    current_email.click_link "click here"
    expect(page).to have_content("Email #{user.email} confirmed")
  end
end
