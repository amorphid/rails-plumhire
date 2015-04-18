require "rails_helper"

describe "jobs/show" do
  let(:job) { Fabricate(:job) }

  it "contains edit link if authenticated" do
    enable(view).to_receive(:can?).and_return(true)
    assign(:user, current_user)
    assign(:job, job)
    render
    expect(rendered).to have_content("Edit Job")
  end

  it "does not contain edit link if unauthenticated" do
    enable(view).to_receive(:can?).and_return(false)
    assign(:user, nil)
    assign(:job, job)
    render
    expect(rendered).not_to have_content("Edit Job")
  end
end

