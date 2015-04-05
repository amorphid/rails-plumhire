require "rails_helper"

describe SignInsController do
  context "#create" do
    before do
      password = Faker::Internet.password
      user = Fabricate(:user, password: password)
      post :create, email: user.email, password: password
    end

    it "sets flash success message if user authenticates" do
      expect(flash[:success]).to be_present
    end

    it "redirects if user authenticates" do
      expect(response).to redirect_to(home_path)
    end
  end
end
