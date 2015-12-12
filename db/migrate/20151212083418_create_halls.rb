class CreateHalls < ActiveRecord::Migration
  def change
    create_table :halls do |t|
      t.string :name
      t.text :description
      t.integer :shop_id

      t.timestamps null: false
    end
  end
end
