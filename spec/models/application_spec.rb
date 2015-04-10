require "rails_helper"

describe Application do
  context "#email" do
    it { should validate_presence_of(:email) }
  end

  context "#job" do
    it { should belong_to(:job) }
  end

  context "#job_id" do
    it { should validate_presence_of(:job_id) }
  end
end
