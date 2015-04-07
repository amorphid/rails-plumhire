require "rails_helper"

describe JobsController do
  context "#new" do
    let(:company) { Fabricate(:company) }
    let(:user) { company.user }

    it "assigns @company" do
      session[:user_id] = user.id
      get :new, company_id: company.id
      expect(assigns[:job]).to be_instance_of(Job)
    end

    it "redirects if not signed in" do
      session[:user_id] = nil
      get :new, company_id: company.id
      expect(response).to redirect_to(sign_in_path)
    end
  end
end
