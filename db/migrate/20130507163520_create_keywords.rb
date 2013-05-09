class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.integer :site_id, null: false
      t.string :word, null: false, length: 30

      t.timestamps
    end

    add_index :keywords, :site_id
  end
end
