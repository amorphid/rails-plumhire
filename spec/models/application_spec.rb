require "rails_helper"

describe Application do
  context "#email" do
    it { should validate_presence_of(:email) }
  end

  context "#job" do
    it { should belong_to(:job) }
  end

  context "#name" do
    it { should validate_presence_of(:name) }
  end

  context "#phone" do
    it { should validate_presence_of(:phone) }
  end
end
