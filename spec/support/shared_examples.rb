shared_examples "redirects_to_home_page_when_signed_in" do
  it "redirects to the home page when signed in" do
    session[:user_id] = current_user.id
    action
    expect(response).to redirect_to(home_path)
  end
end

shared_examples "require_sign_in" do
  it "redirects to the sign in page" do
    delete_session_user_id
    action
    expect(response).to redirect_to sign_in_path
  end
end

shared_examples "require_authorization" do
  it "returns a 403 when not authorized" do
    session[:user_id] = current_user.id
    action
    expect(response.status).to eq(403)
  end
end
