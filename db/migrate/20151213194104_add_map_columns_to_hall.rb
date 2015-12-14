class AddMapColumnsToHall < ActiveRecord::Migration
  def self.up
    change_table :halls do |t|
      t.has_attached_file :map
    end
  end

  def self.down
    drop_attached_file :halls, :map
  end
end
