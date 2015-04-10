require "rails_helper"

describe StaticPagesController do
  let(:user) { build_with_attributes(User) }

  context "#email_sent" do
    before { user.save }

    it "assigns @user" do
      get :email_sent, id: user.id, email: user.email
      expect(assigns[:user]).to be_instance_of(User)
    end

    it_behaves_like "redirects_to_home_page_when_signed_in" do
      let(:action) { get :sign_in }
    end
  end

  context "#home" do
    it_behaves_like "require_sign_in" do
      let(:action) { get :home }
    end
  end

  context "#sign_in" do
    it "sets flash success message on email confirmation" do
      get :sign_in, email: Faker::Internet.email, email_confirmed: true
      expect(flash[:success]).to be_present
    end

    it "does not set flash success message w/o email confirmation" do
      get :sign_in
      expect(flash[:success]).not_to be_present
    end

    it_behaves_like "redirects_to_home_page_when_signed_in" do
      let(:action) { get :sign_in }
    end
  end

  context "#sign_up" do
    it "assigns @user" do
      get :sign_up
      expect(assigns[:user]).to be_instance_of(User)
    end

    it_behaves_like "redirects_to_home_page_when_signed_in" do
      let(:action) { get :sign_up }
    end
  end
end
