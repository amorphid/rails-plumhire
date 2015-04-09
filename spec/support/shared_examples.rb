shared_examples "redirects_to_home_page_when_signed_in" do
  it "redirects to the home page when signed in" do
    session[:user_id] = Fabricate(:user).id
    action
    expect(response).to redirect_to(home_path)
  end
end

shared_examples "require_sign_in" do
  it "redirects to the sign in page" do
    clear_current_user
    action
    expect(response).to redirect_to sign_in_path
  end
end
