require "rails_helper"

describe User do
  context "#email" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  context "#password_digest" do
    it { should validate_presence_of(:password_digest) }
  end
end
