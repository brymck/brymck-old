class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :year,  null: false
      t.integer :value, null: false
      t.references :neighborhood

      t.timestamps
    end
    add_index :ratings, :neighborhood_id
  end
end
