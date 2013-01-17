class Category < ActiveRecord::Base
  attr_accessible :name, :parent_id
  
  has_many :blogs, :dependent => :destroy
  
  validates_presence_of :name, :parent_id
  
  
  def self.find_son_categories
     categories = Category.where("parent_id != 0")
     return categories
  end
end
