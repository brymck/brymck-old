class RenameMetricsSourceId < ActiveRecord::Migration
  def up
    remove_index  :metrics, :exchange_id
    remove_index  :metrics, [:name, :exchange_id]
    remove_column :metrics, :exchange_id

    add_column    :metrics, :source_id, :integer
    add_index     :metrics, :source_id
    add_index     :metrics, [:name, :source_id]
  end

  def down
    remove_index  :metrics, :source_id
    remove_index  :metrics, [:name, :source_id]
    remove_column :metrics, :source_id

    add_column    :metrics, :exchange_id, :integer
    add_index     :metrics, :exchange_id
    add_index     :metrics, [:name, :exchange_id]
  end
end
