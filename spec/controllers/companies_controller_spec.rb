require "rails_helper"

describe CompaniesController do
  let(:company) { build_with_attributes(Company) }

  before { set_session_user_id }

  context "#create" do
    it "creates a company w/ valid input" do
      pre_count = Company.count
      post :create, company: company.attributes
      expect(Company.count).to eq(pre_count + 1)
    end

    it_behaves_like "require_sign_in" do
      let(:action) { post :create }
    end
  end

  context "#new" do
    it "assigns @company" do
      get :new
      expect(assigns[:company]).to be_instance_of(Company)
    end

    it_behaves_like "require_sign_in" do
      let(:action) { get :new }
    end
  end

  context "#show" do
    before { company.save }

    it "assigns @company" do
      get :show, id: company.id
      expect(assigns[:company]).to eq(company)
    end

    it_behaves_like "require_sign_in" do
      let(:action) { get :show, id: company.id }
    end
  end
end
