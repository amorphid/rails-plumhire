require "rails_helper"

feature "Job" do
  context "creation" do
    let(:company)  { Fabricate(:company, user: user) }
    let(:job)      { Fabricate.build(:job) }
    let(:password) { Faker::Internet.password }
    let(:user)     { Fabricate(:user, password: password) }

    background do
      visit sign_in_path
      fill_in :email, with: user.email
      fill_in :password, with: password
      click_button("Submit")
      visit company_path(company)
      click_link("New Job")
    end

    scenario "succeeds w/ valid input" do
      fill_in :job_title, with: job.name
      fill_in :job_description, with: job.description
      click_button("Submit")
      expect(page).to have_content(job.name)
      expect(page).to have_content(job.description)
    end
  end
end
