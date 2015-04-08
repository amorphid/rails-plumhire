require "rails_helper"

feature "Job" do
  context "creation" do
    let(:job)      { Fabricate.build(:job, company: Fabricate(:company)) }

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
