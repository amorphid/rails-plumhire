require "rails_helper"

describe StaticPagesController do
  context "#email_sent" do
    let(:user) { Fabricate(:user) }

    it "assigns @user" do
      get :email_sent, id: user.id, email: user.email
      expect(assigns[:user]).to be_instance_of(User)
    end

    it "redirects if signed in" do
      session[:user_id] = user.id
      get :email_sent, id: user.id
      expect(response).to redirect_to(home_path)
    end
  end

  context "#home" do
    it "redirects if not signed in" do
      session[:user_id] = nil
      get :home
      expect(response).to redirect_to(sign_in_path)
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

    it "redirects if signed in" do
      session[:user_id] = Fabricate(:user).id
      get :sign_in
      expect(response).to redirect_to(home_path)
    end
  end

  context "#sign_up" do
    it "assigns @user" do
      get :sign_up
      expect(assigns[:user]).to be_instance_of(User)
    end

    it "redirects if signed in" do
      session[:user_id] = Fabricate(:user).id
      get :sign_up
      expect(response).to redirect_to(home_path)
    end
  end
end
