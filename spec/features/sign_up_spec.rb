require "rails_helper"

feature "Sign up" do
  let(:user) { Fabricate.build(:user) }
  let!(:email) { user.email }
  let(:password) { user.password }

  scenario "success" do
    visit sign_up_path
    fill_in "user_email", with: email
    fill_in "user_password", with: password
    click_button("Submit")
    expect(page).to have_content("Email sent to #{email}")
    open_email(email)
    current_email.click_link "click here"
    expect(page).to have_content("Email #{email} confirmed")
  end
end
