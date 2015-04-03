require "rails_helper"

describe UsersController do
  context "#create" do
    it "redirects  w/ valid input" do
      user = Fabricate.attributes_for(:user)
      post :create, user: user
      expect(response).to redirect_to(email_sent_path)
    end
  end

  context "#new" do
    it "assigns @user" do
      get :new
      expect(assigns[:user]).to be_instance_of(User)
    end
  end
end
