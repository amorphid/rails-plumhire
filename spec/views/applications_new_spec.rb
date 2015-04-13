require "rails_helper"

describe "jobs/show" do
  let(:job) { Fabricate(:job) }

  it "contains edit link if authorized" do
    assign(:user, current_user)
    assign(:job, Fabricate(:job))
    render
    expect(rendered).to have_content("Edit Job")
  end

  it "does not contain edit link if unauthorized" do
    assign(:user, nil)
    assign(:job, Fabricate(:job))
    render
    expect(rendered).not_to have_content("Edit Job")
  end
end
