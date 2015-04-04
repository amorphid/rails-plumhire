require "rails_helper"

describe "Custom routes" do
  it "GET /email_sent"do
    expect(get: "/email_sent/:id").to route_to(
      controller: "static_pages",
      id:         ":id",
      action:     "email_sent"
    )
  end

  it "GET /sign_up"do
    expect(get: "/sign_up").to route_to(
      controller: "users",
      action:     "new"
    )
  end
end
