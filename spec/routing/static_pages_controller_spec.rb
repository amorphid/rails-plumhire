require "rails_helper"

describe StaticPagesController do
  it "GET /email_sent"do
    expect(get: "/email_sent/:id").to route_to(
      controller: "static_pages",
      id:         ":id",
      action:     "email_sent"
    )
  end

  it "GET /home"do
    expect(get: "/home").to route_to(
      controller: "static_pages",
      action:     "home"
    )
  end

  it "GET /sign_in"do
    expect(get: "/sign_in").to route_to(
      controller: "static_pages",
      action:     "sign_in"
    )
  end

  it "GET /sign_up"do
    expect(get: "/sign_up").to route_to(
      controller: "static_pages",
      action:     "sign_up"
    )
  end
end