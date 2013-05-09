class CreateKeywordLogs < ActiveRecord::Migration
  def change
    create_table :keyword_logs do |t|
      t.integer :keyword_id, null: false
      t.integer :rank, null: false

      t.timestamps
    end

    add_index :keyword_logs, :keyword_id
  end
end
