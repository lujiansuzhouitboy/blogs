class PagesController < ApplicationController
  include PagesHelper,SessionHelper
  def index
  end
  def home
    @category_id = params[:category_id]
    if params[:my_id].nil?
    else
      session[:blog_user] = current_user.id
    end
  end
  def search
    @blogs=Blog.find_by_info(params[:info])
    puts params[:info]
  end
end
