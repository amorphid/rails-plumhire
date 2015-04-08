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

    it_behaves_like "require_sign_in" do
      let(:action) { post :create, company_id: company.id, job: Fabricate.build(:job, company: company).attributes }
    end
  end

  context "#new" do
    it "assigns @company" do
      session[:user_id] = user.id
      get :new, company_id: company.id
      expect(assigns[:job]).to be_instance_of(Job)
    end

    it_behaves_like "require_sign_in" do
      let(:action) { get :new, company_id: company.id }
    end
  end

  context "#show" do
    let(:job) { Fabricate(:job, company: company) }

    it "assigns @show" do
      session[:user_id] = company.user.id
      get :show, company_id: company.id, id: job.id
      expect(assigns[:job]).to eq(job)
    end

    it_behaves_like "require_sign_in" do
      let(:action) { get :show, company_id: company.id, id: job.id }
    end
  end
end
