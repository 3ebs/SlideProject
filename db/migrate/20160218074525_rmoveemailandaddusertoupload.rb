class Rmoveemailandaddusertoupload < ActiveRecord::Migration
  def change
    change_table :uploads do |t|
      t.belongs_to :user, index: true
      
  end
  end
end
