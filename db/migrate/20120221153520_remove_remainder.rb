class RemoveRemainder < ActiveRecord::Migration
  def up
    drop_table :slugs
    drop_table :source_translations
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't recover the deleted tables"
  end
end
