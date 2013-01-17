class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :content
      t.integer :blog_id
      t.integer :user_id
      t.integer :status, :default => 0

      t.timestamps
    end
  end
 
  def self.down
    drop_table :comments
  end
end
