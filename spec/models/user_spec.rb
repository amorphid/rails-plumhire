require "rails_helper"

describe User do
  it { should require_presence_of(:email) }
  it { should require_presence_of(:password_digest) }
end
