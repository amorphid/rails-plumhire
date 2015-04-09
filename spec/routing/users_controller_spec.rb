require "rails_helper"

describe "User routes" do
  it do
    expect(post: "/users").to route_to(
      controller: "users",
      action:     "create"
    )
  end
end
