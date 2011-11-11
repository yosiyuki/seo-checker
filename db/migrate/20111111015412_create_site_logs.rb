class CreateSiteLogs < ActiveRecord::Migration
  def change
    create_table :site_logs do |t|
      t.integer :site_id, :null => false
      t.date :checked_on, :null => false
      t.integer :sites, :null => false, :default => 0
      t.integer :links, :null => false, :default => 0
      t.integer :relateds, :null => false, :default => 0

      t.timestamps
    end

    add_index :site_logs, :site_id
    add_index :site_logs, :checked_on
  end
end
