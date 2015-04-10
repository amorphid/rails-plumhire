require "rails_helper"

describe SignInsController do
  let(:user) { current_user }

  context "#create" do
    before do
      post :create, email: user.email, password: user.password
    end

    it "sets flash success message if user authenticates" do
      expect(flash[:success]).to be_present
    end

    it "redirects if user authenticates" do
      expect(response).to redirect_to(home_path)
    end
  end
end
