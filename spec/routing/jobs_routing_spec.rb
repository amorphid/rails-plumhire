require "rails_helper"

describe JobsController do
  it do
    expect(get: "/companies/:company_id/jobs/:id/edit").to route_to(
      controller: "jobs",
      company_id: ":company_id",
      id:         ":id",
      action:     "edit"
    )
  end

  it do
    expect(get: "/companies/:company_id/jobs/new").to route_to(
      controller: "jobs",
      company_id: ":company_id",
      action:     "new"
    )
  end

  it do
    expect(get: "/companies/:company_id/jobs/:id").to route_to(
      controller: "jobs",
      company_id: ":company_id",
      id:         ":id",
      action:     "show"
    )
  end

  it do
    expect(post: "/companies/:company_id/jobs").to route_to(
      controller: "jobs",
      company_id: ":company_id",
      action:     "create"
    )
  end

  it do
    expect(put: "/companies/:company_id/jobs/:id").to route_to(
      controller: "jobs",
      company_id: ":company_id",
      id:         ":id",
      action:     "update"
    )
  end
end
