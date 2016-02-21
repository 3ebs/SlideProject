class Addcount < ActiveRecord::Migration
  def change
    change_table :uploads do |t|
      t.integer :count

  end
  end
end
