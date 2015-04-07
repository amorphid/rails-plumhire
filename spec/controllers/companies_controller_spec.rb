require "rails_helper"

describe CompaniesController do
  context "#create" do
    it "redirects if not signed in" do
      session[:user_id] = nil
      post :create
      expect(response).to redirect_to(sign_in_path)
    end
  end

  context "#new" do
    it "assigns @company" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(assigns[:company]).to be_instance_of(Company)
    end

    it "redirects if not signed in" do
      session[:user_id] = nil
      get :new
      expect(response).to redirect_to(sign_in_path)
    end
  end
end
