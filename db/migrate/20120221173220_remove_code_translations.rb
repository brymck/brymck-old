class RemoveCodeTranslations < ActiveRecord::Migration
  def up
    drop_table :code_translations
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't recover the deleted table"
  end
end
