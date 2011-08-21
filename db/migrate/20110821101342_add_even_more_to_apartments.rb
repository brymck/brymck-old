class AddEvenMoreToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :management_fee, :integer
    add_column :apartments, :living_area, :decimal, precision: 5, scale: 2
  end
end
