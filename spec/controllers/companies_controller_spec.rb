require "rails_helper"

describe CompaniesController do
  context "#create" do
    it "creates a company w/ valid input" do
      session[:user_id] = Fabricate(:user).id
      pre_count = Company.count
      post :create, company: Fabricate.attributes_for(:company)
      expect(Company.count).to eq(pre_count + 1)
    end

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

  context "#show" do
    it "assigns @company" do
      session[:user_id] = Fabricate(:user).id
      company = Fabricate(:company)
      get :new
      expect(assigns[:company]).to eq(company)
    end

    it "redirects if not signed in" do
      session[:user_id] = nil
      post :create
      expect(response).to redirect_to(sign_in_path)
    end
  end
end
