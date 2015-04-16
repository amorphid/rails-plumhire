module ApplicationHelper
  def can?(action, object)
    rules = {}

    if @user && (User.exists? @user.id)
      rules[:edit] = { object.class => true}
    else
      rules[:edit] = { object.class => false}
    end

    rules[action][object.class]
  end
end
