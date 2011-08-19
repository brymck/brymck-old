class AddTestToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :test, :boolean, null: false, default: false
    add_index :subscribers, :test
  end
end
