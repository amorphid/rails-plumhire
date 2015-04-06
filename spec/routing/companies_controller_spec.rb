require "rails_helper"

describe CompaniesController do
  it "GET /companies/new" do
    expect(get: "/companies").to route_to(
      controller: "companies",
      action:     "new"
    )
  end
end