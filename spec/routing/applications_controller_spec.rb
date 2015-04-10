require "rails_helper"

describe ApplicationsController do
  it do
    expect(get: "/jobs/:job_id/applications/new").to route_to(
      controller: "applications",
      job_id:     ":job_id",
      action:     "new"
    )
  end
end
