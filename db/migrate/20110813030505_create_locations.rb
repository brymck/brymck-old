class CreateLocations < ActiveRecord::Migration
  def self.up
    # Locations
    create_table :locations do |t|
      t.string :name
      t.string :cached_slug
    end
    Location.create_translation_table! name: :string

    # Business hours
    create_table :business_hours do |t|
      t.integer :day
      t.string :opening
      t.string :closing
      t.string :time_zone
      t.references :location
    end
    add_index :business_hours, :location_id

    # Addresses
    create_table :addresses do |t|
      t.string :country
      t.string :zip
      t.string :state
      t.string :city
      t.string :street
      t.string :extra
      t.references :location
    end
    add_index :addresses, :location_id
  end

  def self.down
    Location.drop_translation_table! name: :string
    drop_table :addresses
    drop_table :business_hours
    drop_table :locations
  end
end
