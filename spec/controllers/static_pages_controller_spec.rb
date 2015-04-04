require "spec_helper"

describe StaticPagesController do
  context "#email_sent" do
    it "assigns @user" do
      user = Fabricate(:user)
      get :email_sent, id: user.id
      expect(assigns[:user]).to eq(user)
    end
  end
end
