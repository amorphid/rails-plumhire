require "rails_helper"

describe Company do
  context "#name" do
    it { should validate_presence_of(:name) }

  end

  context "#user" do
    it { should belong_to(:user) }
  end

  context "#user_id" do
    it { should validate_presence_of(:user_id) }
  end
end
