module BlogsHelper
  def current_blog(blog_id)
    session[:current_blog]=blog_id
  end

  def user_category_blog(user_id,category_id)
    blogs = Blog.where("user_id = ? and category_id = ? and status = 0 ",user_id,category_id).all
    return blogs
  end
end
