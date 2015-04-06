require "rails_helper"

describe CompaniesController do
  context "#new" do
    it "assigns @company" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(assigns[:company]).to be_instance_of(Company)
    end

    it "redirects if not signed in" do
      session[:user_id] = nil
      get :new
      expect(response).to redirect_to(sign_in_page)
    end
  end
end
