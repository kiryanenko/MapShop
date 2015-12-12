class AddColumnToHalls < ActiveRecord::Migration
  def change
    add_column :halls, :items_url, :string
  end
end
