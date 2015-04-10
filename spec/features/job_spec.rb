require "rails_helper"

feature "Job" do
  let(:job) { build_with_attributes(Job) }

  context "creation" do
    background do
      sign_in
      visit company_path(job.company)
      click_link("New Job")
    end

    scenario "succeeds w/ valid input" do
      fill_in :job_title, with: job.title
      fill_in :job_description, with: job.description
      click_button("Submit")
      expect(page).to have_content(job.title)
      expect(page).to have_content(job.description)
    end
  end
end
