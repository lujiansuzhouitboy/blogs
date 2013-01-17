class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :password
      t.integer :status, :default => 0
      t.integer :is_admin, :default => 0 #0:false 1:true
      t.string :phone

      t.timestamps
    end
  end
 
  def self.down
    drop_table :users
  end
end
