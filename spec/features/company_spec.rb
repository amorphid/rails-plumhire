require "rails_helper"

feature "Company" do
  context "creation" do
    let(:company)  { build_with_attributes(Company) }

    background do
      sign_in(company.user)
      click_link("New Company")
    end

    scenario "succeeds w/ valid input" do
      fill_in :company_name, with: company.name
      click_button("Submit")
      expect(page).to have_content(company.name)
    end
  end
end
