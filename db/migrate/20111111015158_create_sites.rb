class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name, :null => false
      t.string :domain, :null => false, :length => 2000
      t.text :note

      t.timestamps
    end

    add_index :sites, :name
    add_index :sites, :domain
  end
end
