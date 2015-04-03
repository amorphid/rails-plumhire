require "rails_helper"

feature "Sign up" do
  let(:email) { Faker::Internet.email }

  scenario "success" do
    visit sign_up_page
    fill_in "user_email", with: email
    fill_in "user_password", with: Faker::Internet.password
    click_button("Submit")
    expect(page).to have_content("Email sent to #{email}")
    open_email(email)
    current_email.click_link "click here"
    expect(page).to have_content("Email #{email} confirmed")
  end
end
