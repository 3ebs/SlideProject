class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.belongs_to :upload 
      t.string :url
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
