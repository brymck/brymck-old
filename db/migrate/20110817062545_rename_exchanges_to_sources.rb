class RenameExchangesToSources < ActiveRecord::Migration
  def up
    # Remove old translation table
    Exchange.drop_translation_table!

    # Remove misnamed indexes
    remove_index :exchanges, :name
    remove_index :exchanges, :abbr
    remove_index :exchanges_quotes, [:exchange_id, :quote_id]
    remove_index :metrics, :exchange_id
    remove_index :metrics, [:name, :exchange_id]

    # Rename tables and column
    rename_table :exchanges, :sources
    rename_table :exchanges_quotes, :quotes_sources
    rename_column :quotes_sources, :exchange_id, :source_id

    # Rebuild indexes
    add_index :metrics, :exchange_id
    add_index :metrics, [:name, :exchange_id], unique: true
    add_index :quotes_sources, [:quote_id, :source_id], unique: true
    add_index :sources, :name
    add_index :sources, :abbr, unique: true
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't recover the deleted indexes"
  end
end
