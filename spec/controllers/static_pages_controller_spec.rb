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
  end
end
