require "rails_helper"

describe "Job" do
  context "#company" do
    it { should belong_to(:company) }
  end

  context "#company_id" do
    it { should validate_presence_of(:company_id) }
  end

  context "#title" do
    it { should validate_presence_of(:title) }
  end
end
