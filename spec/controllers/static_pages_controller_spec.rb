require "rails_helper"

describe StaticPagesController do
  context "#email_sent" do
    it "assigns @user" do
      user = Fabricate(:user)
      get :email_sent, id: user.id
      expect(assigns[:user]).to eq(user)
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

    it "skips redirects if not signed in" do
      session[:user_id] = nil
      get :sign_in
      expect(response).not_to redirect_to(home_path)
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

    it "skips redirects if not signed in" do
      session[:user_id] = nil
      get :sign_up
      expect(response).not_to redirect_to(home_path)
    end
  end
end
