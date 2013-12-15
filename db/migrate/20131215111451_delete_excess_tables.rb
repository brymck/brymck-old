class DeleteExcessTables < ActiveRecord::Migration
  def up
    %w(code_tags posts_tags subscribers tags).each do |table|
      drop_table table
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't recover the deleted tables"
  end
end
