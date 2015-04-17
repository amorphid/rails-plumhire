module TotesCan
  def authenticate_guest!
    redirect_to home_path unless current_user.nil?
  end

  def authenticate_user!
    redirect_to sign_in_path if current_user.nil?
  end

  def authorize!(action, object)
    unless current_user == object.user
      render status: 403
    end
  end

  def can?(action, object)
    klass = (object.class == Class) ? object : object.class

    if @user && (User.exists? @user.id)
      rules[:edit] = { klass => true}
    else
      rules[:edit] = { klass => false}
    end

    rules[action][klass]
  end

  def rules
    @rules ||= {}
  end
end
