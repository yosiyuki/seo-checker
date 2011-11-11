class CreateSiteLogs < ActiveRecord::Migration
  def change
    create_table :site_logs do |t|
      t.integer :site_id, :null => false
      t.datetime :checked_at, :null => false
      t.integer :links, :null => false, :default => 0

      t.timestamps
    end

    add_index :site_logs, :site_id
    add_index :site_logs, :checked_at
    add_index :site_logs, :links
  end
end
