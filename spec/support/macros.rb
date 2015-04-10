def build_with_attributes(klass)
  camelized_symbol = klass.to_s.underscore.to_sym
  klass.new(Fabricate.attributes_for(camelized_symbol))
end

def clear_current_user
  session[:user_id] = nil
end

def set_current_user(user)
  session[:user_id] = user.id
end

def sign_in(user)
  visit sign_in_path
  fill_in :email,    with: user.email
  fill_in :password, with: "password"
  click_button "Submit"
end
