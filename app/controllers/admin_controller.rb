class AdminController < ApplicationController
  include UsersHelper
  def index
    @users = User.paginate_by_sql("select * from users",:page => params[:page], :per_page => 5, :order => "id desc")
  end

  def update
    if  User.find(params[:id]).status == 1
      User.find(params[:id]).update_attribute("status","0")
    else
      User.find(params[:id]).update_attribute("status","1")
    end
    redirect_to :action => 'index'
  end
end
