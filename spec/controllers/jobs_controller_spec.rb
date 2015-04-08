require "rails_helper"

describe JobsController do
  let(:company) { Fabricate(:company) }
  let(:user) { company.user }

  context "#create" do
    it "creates a Job" do
      pre_count = Job.count
      session[:user_id] = user.id
      post :create, company_id: company.id, job: Fabricate.build(:job, company: company).attributes
      expect(Job.count).to eq(pre_count + 1)
    end

    it "redirects if not signed in" do
      session[:user_id] = nil
      post :create, company_id: company.id, job: Fabricate.build(:job, company: company).attributes
      expect(response).to redirect_to(sign_in_path)
    end
  end

  context "#new" do
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
