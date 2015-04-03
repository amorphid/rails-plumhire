require "rails_helper"

describe UsersController do
  describe "#new" do
    it "assigns @user" do
      get :new
      expect(assigns[:user]).to be_instance_of(User)
    end
  end
end
