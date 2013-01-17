#encoding:utf-8
class SessionController < ApplicationController
  include SessionHelper
  
  def signin
    @user = User.new
  end
  
  def signout
    session[:user] = nil
    redirect_to root_path(:my_id => session[:first_user])
  end

  def create
    user = User.authorize(params[:user][:name],params[:user][:password])
    if user == nil
      flash[:notice] ="输入有误，请再次登陆"
      redirect_to :action => 'signin'
    else
      if user.status == 1
        flash[:notice] ="您的用户被冻结，请与原理员联系"
        redirect_to :action => 'signin'
      else
        save_current_user(user)
        redirect_to root_path
      end
    end
  end
end
