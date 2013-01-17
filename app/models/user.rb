class User < ActiveRecord::Base
  attr_accessible :is_admin, :name, :password, :phone, :status
  has_many :blogs, :dependent => :destroy

  validates_presence_of :name, :password, :phone
  def self.authorize(user_name,user_password)
    user = User.where("name = ? and password = ?",user_name,user_password).first
    if user.nil?
      return nil
    else
    return user
    end
  end

  def self.authorize_admin(user_id)
    is_admin = User.find(user_id).is_admin
    return is_admin
  end
end
