class AddColumnLangToSites < ActiveRecord::Migration
  def change
    add_column :sites, :lang, :string, length: 3, null: false, default: :jp
  end
end
