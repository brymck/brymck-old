class RemoveTranslations < ActiveRecord::Migration
  def up
    %w(comment language post tag).each do |name|
      drop_table "#{name}_translations"
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't recover the deleted tables"
  end
end
