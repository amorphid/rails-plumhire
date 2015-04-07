require "rails_helper"

feature "Company" do
  context "creation" do
    let(:company)  { Fabricate.build(:company, name: Faker::Company.name) }
    let(:password) { Faker::Internet.password }
    let(:user)     { Fabricate(:user, password: password) }

    scenario "succeeds w/ valid input" do
      visit sign_in_path
      fill_in :email, with: user.email
      fill_in :password, with: password
      click_button("Submit")
      click_link("New Company")
      fill_in :company_name, with: company.name
      click_button("Submit")
      expect(page).to have_content(company.name)
    end
  end
end
