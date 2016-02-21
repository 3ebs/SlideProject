class Remove < ActiveRecord::Migration
  def change
  
    remove_column :uploads, :email_id
  
  end
end
