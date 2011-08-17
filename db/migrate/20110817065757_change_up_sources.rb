class ChangeUpSources < ActiveRecord::Migration
  def up
    remove_index  :sources, :abbr
    remove_column :sources, :abbr

    add_column    :sources, :url, :string, null: false, default: 0
    change_column :sources, :url, :string, null: false
    add_index     :sources, :url, unique: true
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't recover the deleted columns and indexes"
  end
end
