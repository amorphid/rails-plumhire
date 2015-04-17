module TotesCan
  def can?(action, object)
    if @user && (User.exists? @user.id)
      rules[:edit] = { object.class => true}
    else
      rules[:edit] = { object.class => false}
    end

    rules[action][object.class]
  end

  def rules
    @rules ||= {}
  end
end
