class Blog < ActiveRecord::Base
  attr_accessible :category_id, :content, :status, :title, :user_id
  belongs_to :user
  belongs_to :category
  
  has_many :comments, :dependent => :destroy
  
  validates_presence_of :content, :title, :user_id, :category_id
  
  def self.find_by_info(info)
    blogs = Blog.where("title like ?",info+"%")
    return blogs
  end  
end
