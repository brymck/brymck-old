class AddMoreToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :room_number, :integer
    add_column :apartments, :url, :string
    add_column :apartments, :rent, :integer
    add_column :apartments, :key_money_months, :decimal, precision: 3, scale: 1
    add_column :apartments, :rooms, :integer
    add_column :apartments, :living_room, :boolean
    add_column :apartments, :dining_room, :boolean
    add_column :apartments, :kitchen, :boolean
    add_column :apartments, :construction_date, :date
  end
end
