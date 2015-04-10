require "rails_helper"

describe CompaniesController do
  it do
    expect(get: "/companies/:id").to route_to(
      controller: "companies",
      id:         ":id",
      action:     "show"
    )
  end

  it do
    expect(get: "/companies/new").to route_to(
      controller: "companies",
      action:     "new"
    )
  end

  it do
    expect(post: "/companies").to route_to(
      controller: "companies",
      action:     "create"
    )
  end
end
