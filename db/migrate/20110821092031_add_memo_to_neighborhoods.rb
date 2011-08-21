class AddMemoToNeighborhoods < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :memo, :text
  end
end
