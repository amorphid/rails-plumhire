require "rails_helper"

describe JobsController do
  it "GET /companies/:company_id/jobs/new" do
    expect(get: "/companies/:company_id/jobs/new").to route_to(
      controller: "jobs",
      company_id: ":company_id",
      action:     "new"
    )
  end
end