require "rails_helper"

describe UsersController do
  context "#create" do
    let(:user_attr) { Fabricate.attributes_for(:user) }

    it "sends an email w/ valid input" do
      pre_count = ActionMailer::Base.deliveries.count
      post :create, user: user_attr
      expect(ActionMailer::Base.deliveries.count).to eq(pre_count + 1)
    end

    it "creates a user w/ valid input" do
      pre_count = User.count
      post :create, user: user_attr
      expect(User.count).to eq(pre_count + 1)
    end

    it "redirects w/ valid input" do
      post :create, user: user_attr
      user = User.find_by(email: user_attr[:email])
      expect(response).to redirect_to(email_sent_path(user, { email: user.email }))
    end
  end
end
