class Counter < ActiveRecord::Migration
  def change
     change_table :uploads do |t|
      t.integer :counter_a

  end
  end
end
