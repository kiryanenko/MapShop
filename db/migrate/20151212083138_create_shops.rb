class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.text :description
      t.string :location
      t.integer :brand_id

      t.timestamps null: false
    end
  end
end
