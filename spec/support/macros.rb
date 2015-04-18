def build_with_attributes(klass)
  camelized_symbol = klass.to_s.underscore.to_sym
  klass.new(Fabricate.attributes_for(camelized_symbol))
end

def delete_session_user_id
  session[:user_id] = nil
end

def current_user
  email    = "usie@mc.user"
  password = "passwerd"

  # using a unique instance variable until better approach found
  @user_jasdlknsdkjnvsdfjlskdjf ||= if User.exists? email: email
    get_current_user(email, password)
  else
    Fabricate(:user, email: email, password: password)
  end
end

def get_current_user(email, password)
  user = User.find_by(email: email)
  user.password = password
  user
end

def enable  (object)
  klass = Class.new do
    attr_reader :method_name,
                :object,
                :value

    def initialize(object)
      @object = object
    end

    def and_return(value)
      object.instance_variable_set("@stubbed_value", value)
      mahjewel = Module.new
      mahjewel.send(:define_method, method_name.to_s) { |*_| @stubbed_value }
      object.extend(mahjewel)
    end

    def to_receive(method_name)
      @method_name = method_name
      self
    end
  end

  klass.new(object)
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
