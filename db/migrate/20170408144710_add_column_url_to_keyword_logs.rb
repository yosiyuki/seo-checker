class AddColumnUrlToKeywordLogs < ActiveRecord::Migration
  def change
    add_column :keyword_logs, :url, :string, length: 1000
  end
end
