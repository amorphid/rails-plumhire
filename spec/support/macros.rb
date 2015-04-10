def build_with_attributes(klass)
  camelized_symbol = klass.to_s.underscore.to_sym
  klass.new(Fabricate.attributes_for(camelized_symbol))
end

def delete_session_user_id
  session[:user_id] = nil
end

def current_user
  @user ||= Fabricate(:user)
end

def set_session_user_id
  session[:user_id] = current_user.id
end

def sign_in
  visit sign_in_path
  fill_in :email,    with: current_user.email
  fill_in :password, with: current_user.password
  click_button "Submit"
end
