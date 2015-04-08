require "rails_helper"

describe JobsController do
  let(:job) { Job.new(Fabricate.attributes_for(:job)) }

  before { set_current_user(job.company.user) }

  context "#create" do
    it "creates a Job" do
      pre_count = Job.count
      post :create, company_id: job.company_id, job: job.attributes
      expect(Job.count).to eq(pre_count + 1)
    end

    it_behaves_like "require_sign_in" do
      let(:action) { post :create, company_id: job.company_id, job: job.attributes }
    end
  end

  context "#new" do
    it "assigns @company" do
      get :new, company_id: job.company_id
      expect(assigns[:job]).to be_instance_of(Job)
    end

    it_behaves_like "require_sign_in" do
      let(:action) { get :new, company_id: job.company_id }
    end
  end

  context "#show" do
    before { job.save }

    it "assigns @show" do
      get :show, company_id: job.company_id, id: job.id
      expect(assigns[:job]).to eq(job)
    end

    it_behaves_like "require_sign_in" do
      let(:action) { get :show, company_id: job.company.id, id: job.id }
    end
  end
end
