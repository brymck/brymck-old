class AddMemoToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :memo, :text
  end
end
