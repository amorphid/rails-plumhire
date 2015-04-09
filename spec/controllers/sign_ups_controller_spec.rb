require "rails_helper"

describe SignUpsController do
  context "#create" do
    let(:user) do
      Fabricate.build(:user)
    end

    it "sends an email w/ valid input" do
      pre_count = ActionMailer::Base.deliveries.count
      post :create, email: user.email, password: user.password
      expect(ActionMailer::Base.deliveries.count).to eq(pre_count + 1)
    end

    it "creates a user w/ valid input" do
      pre_count = User.count
      post :create, email: user.email, password: user.password
      expect(User.count).to eq(pre_count + 1)
    end

    it "redirects w/ valid input" do
      post :create, email: user.email, password: user.password
      expect(response).to redirect_to(email_sent_path(
        User.find_by(email: user.email),
        { email: user.email }
      ))
    end
  end
end
