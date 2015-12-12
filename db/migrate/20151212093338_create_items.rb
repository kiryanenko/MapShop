class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.float :x
      t.float :y
      t.integer :hall_id

      t.timestamps null: false
    end
  end
end
