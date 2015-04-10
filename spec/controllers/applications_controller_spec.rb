require "rails_helper"

describe ApplicationsController do
  let(:application) { build_with_attributes(Application) }

  context "new" do
    it "assigns @application" do
      get :new, job_id: application.job.id
      expect(assigns[:application]).to be_instance_of(Application)
    end

    it_behaves_like "require_sign_in" do
      let(:action) { get :new, job_id: application.job.id }
    end
  end
end
