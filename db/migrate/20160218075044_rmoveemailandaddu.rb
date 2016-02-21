class Rmoveemailandaddu < ActiveRecord::Migration
   def down
    remove_column :uploads ,:email_id
  end
  
end
