require "rails_helper"

describe ApplicationsController do
  let(:application) { build_with_attributes(Application) }

  before { set_session_user_id }

  context "create" do
    it "creates an Application" do
      pre_count = Application.count
      post(
        :create,
        job_id: application.job_id,
        application: application.attributes
      )
      expect(Application.count).to eq(pre_count + 1)
    end

    it_behaves_like "require_sign_in" do
      let(:action) { post(:create, job_id: application.job_id) }
    end
  end

  context "new" do
    it "assigns @application" do
      get :new, job_id: application.job_id
      expect(assigns[:application]).to be_instance_of(Application)
    end

    it_behaves_like "require_sign_in" do
      let(:action) { get :new, job_id: application.job_id }
    end
  end
end
