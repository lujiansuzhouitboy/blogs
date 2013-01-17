module SessionHelper
  def current_user
    user_id = session[:user]
    User.find(user_id)
  end

  def save_current_user(user)
    current_user_id(user)
  end

  def sign_status
    user_id = session[:user]
    blog_user_id = session[:blog_user]
    if user_id.nil?
    return 0 #visitors
    elsif user_id == blog_user_id
    return 1 #user_self
    elsif is_admin?
    return 2 #admin
    elsif user_id
    return 3 #other users
    else
    return 404
    end
  end

  private

  def is_admin?
    user_id = session[:user]
    user_status = User.authorize_admin(user_id)
    if user_status == 1
    return true
    else
    return false
    end
  end

  def current_user_id(user)
    session[:user] = user.id
  end
end
