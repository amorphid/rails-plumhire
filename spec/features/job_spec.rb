require "rails_helper"

feature "Job" do
  background { sign_in }

  context "creation" do
    let(:job) { build_with_attributes(Job) }

    background do
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

  context "edit" do
    let(:job) { Fabricate(:job) }

    background do
      visit company_job_path(job.company, job)
      click_link("Edit Job")
    end

    scenario "succeeds w/ valid input" do
      new_title = job.title + ", the other one"

      fill_in :job_title, with: new_title
      click_button("Submit")
      expect(page).to have_content(new_title)
    end
  end
end
