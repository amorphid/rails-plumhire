require "rails_helper"

describe SignUpsController do
  it do
    expect(post: "/sign_ups").to route_to(
      controller: "sign_ups",
      action:     "create"
    )
  end
end
