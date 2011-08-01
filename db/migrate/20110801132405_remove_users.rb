class RemoveUsers < ActiveRecord::Migration
  def self.up
    drop_table :users
    remove_column :posts, :user_id
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
