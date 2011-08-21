# coding: utf-8

class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.integer :zip
      t.string :country,    default: "日本",   null: false
      t.string :prefecture, default: "東京都", null: false
      t.string :city
      t.string :ward
      t.string :town
      t.integer :district
      t.integer :block
      t.integer :house
      t.references :neighborhood

      t.timestamps
    end
    add_index :apartments, :neighborhood_id
  end
end
