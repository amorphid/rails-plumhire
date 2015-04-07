require "rails_helper"

describe CompaniesController do
  it "GET /companies/:id" do
    expect(get: "/companies/:id").to route_to(
      controller: "companies",
      id:         ":id"
      action:     "show"
    )
  end

  it "GET /companies/new" do
    expect(get: "/companies/new").to route_to(
      controller: "companies",
      action:     "new"
    )
  end

  it "POST /companies" do
    expect(post: "/companies").to route_to(
      controller: "companies",
      action:     "create"
    )
  end
end
