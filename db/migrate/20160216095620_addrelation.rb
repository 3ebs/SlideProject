class Addrelation < ActiveRecord::Migration
  def change
  change_table :uploads do |t|
      t.belongs_to :email, index: true

  end
end
end
