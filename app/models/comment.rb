class Comment < ActiveRecord::Base
  attr_accessible :blog_id, :content, :status, :user_id
  belongs_to :user
  belongs_to :blog
  
  validates_presence_of :blog_id, :content, :user_id
  
end
