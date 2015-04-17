require "rails_helper"

describe User do
  context "#companies" do
    it { should have_many(:companies) }
  end

  context "#email" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  context "#jobs" do
    it { should have_many(:jobs) }
  end

  context "#password_digest" do
    it { should validate_presence_of(:password_digest) }
  end
end
