module TotesCan
  def authenticate_guest!
    redirect_to home_path unless current_user.nil?
  end

  def authenticate_user!
    redirect_to sign_in_path if current_user.nil?
  end

  def authorize!(action, object)
    klass = let_klass(object)

    case { action => klass }
    when { :read => Job }
      render status: 403 unless can? :read, object
    end
  end

  def can?(action, object)
    klass = let_klass(object)

    case { action => klass }
    when { :update => Job }
      @user == object.user
    when { :read => Job }
      @user == object.user
    end
  end

  def current_user
    # if session[:user_id] is nil, no need for database call
    return unless session[:user_id]

    if User.exists? session[:user_id]
      @user = User.find(session[:user_id])
    else
      session[:user_id] = nil
    end
  end

  def let_klass(object)
    (object.class == Class) ? object : object.class
  end
end
