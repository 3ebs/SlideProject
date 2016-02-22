class Likers < ActiveRecord::Migration
  def change
    
     create_table :liker do |t|
      t.integer :slide_id
      t.integer :user_id 
      t.timestamps null: false
    end
    
  end
end
