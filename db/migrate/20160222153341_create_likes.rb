class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :counter
      t.belongs_to :slide 
      t.timestamps null: false
    end
  end
end
