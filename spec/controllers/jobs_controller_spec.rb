require "rails_helper"

describe JobsController do
  let(:job) { build_with_attributes(Job) }

  before { set_session_user_id }

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

  context "#edit" do
    before { job.save }

    it "assigns @job" do
      get :edit, company_id: job.company_id, id: job.id
      expect(assigns[:job]).to eq(job)
    end

    it_behaves_like "require_sign_in" do
      let(:action) { get :edit, company_id: job.company_id, id: job.id }
    end
  end

  context "#new" do
    it "assigns @job" do
      get :new, company_id: job.company_id
      expect(assigns[:job]).to be_instance_of(Job)
    end

    it_behaves_like "require_sign_in" do
      let(:action) { get :new, company_id: job.company_id }
    end
  end

  context "#show" do
    before { job.save }

    it "assigns @job" do
      get :show, company_id: job.company_id, id: job.id
      expect(assigns[:job]).to eq(job)
    end

    it_behaves_like "require_authorization" do
      let(:action) do
        job.user = Fabricate(:user)
        get :show, company_id: job.company.id, id: job.id
      end
    end

    it_behaves_like "require_sign_in" do
      let(:action) { get :show, company_id: job.company.id, id: job.id }
    end
  end

  context "#update" do
    before { job.save }

    it "updates a job" do
      new_title = job.title + ", new & improved"
      job.title = new_title
      put :update, company_id: job.company.id, id: job.id, job: job.attributes
      expect(Job.find(job.id).title).to eq(new_title)
    end

    it_behaves_like "require_sign_in" do
      let(:action) { put :update, company_id: job.company.id, id: job.id }
    end
  end
end
