require "rails_helper"

feature "Application" do
  let(:application) { build_with_attributes(Application) }

  context "creation" do
    background do
      sign_in(application.job.company.user)
      visit job_application_path(application.job)
      click("New Application")
    end

    scenario "succeeds w/ valid input" do
      fill_in :application_name, with: application.name
      fill_in :application_email, with: application.email
      fill_in :application_phone, with: application.phone
      click_button("Submit")
      expect(page).to have_content(application.name)
      expect(page).to have_content(application.email)
      expect(page).to have_content(application.phone)
    end
  end
end
