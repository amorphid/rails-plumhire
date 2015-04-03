require "rails_helper"

describe "Custom routes" do

  it "GET /sign_up"do
    expect(get: "/sign_up").to route_to(
      controller: "users",
      action:     "new"
    )
  end
end
