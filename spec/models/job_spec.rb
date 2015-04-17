require "rails_helper"

describe Job do
  context "#applications" do
    it { should have_many(:applications) }
  end

  context "#company" do
    it { should belong_to(:company) }
  end

  context "#company_id" do
    it { should validate_presence_of(:company_id) }
  end

  context "#title" do
    it { should validate_presence_of(:title) }
  end

  context "#user" do
    it { should belong_to(:user) }
  end

  context "#user_id" do
    it { should validate_presence_of(:user_id) }
  end
end
