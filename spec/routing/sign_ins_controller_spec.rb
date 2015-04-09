require "rails_helper"

describe SignInsController do
  it do
    expect(post: "/sign_ins").to route_to(
      controller: "sign_ins",
      action:     "create"
    )
  end
end
