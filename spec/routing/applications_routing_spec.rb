require "rails_helper"

describe ApplicationsController do
  it do
    expect(get: "/jobs/:job_id/applications/new").to route_to(
      controller: "applications",
      job_id:     ":job_id",
      action:     "new"
    )
  end

  it do
    expect(get: "/jobs/:job_id/applications/:id").to route_to(
      controller: "applications",
      job_id:     ":job_id",
      id:         ":id",
      action:     "show"
    )
  end

  it do
    expect(post: "/jobs/:job_id/applications/").to route_to(
      controller: "applications",
      job_id:     ":job_id",
      action:     "create"
    )
  end
end
