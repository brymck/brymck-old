class CreateNeighborhoods < ActiveRecord::Migration
  def up
    create_table :neighborhoods do |t|
      t.string :name
      t.float :lat
      t.float :lng
      t.string :cached_slug
    end
    
    Neighborhood.create_translation_table! name: :string
  end

  def down
    drop_table :neighborhoods
    Neighborhood.drop_translation_table!
  end
end
