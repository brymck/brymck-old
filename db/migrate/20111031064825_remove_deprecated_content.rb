class RemoveDeprecatedContent < ActiveRecord::Migration
  def up
    drop_table :apartments
    drop_table :neighborhoods
    drop_table :neighborhood_translations
    drop_table :ratings
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't recover the deleted tables"
  end
end
