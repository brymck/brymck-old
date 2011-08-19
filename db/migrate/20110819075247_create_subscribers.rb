class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :name,          null: false
      t.string :email,         null: false
      t.boolean :approved,     null: false, default: false
      t.boolean :active,       null: false, default: true
      t.boolean :unsubscribed, null: false, default: false

      t.timestamps
    end
    add_index :subscribers, :name
    add_index :subscribers, :email, unique: true
  end
end
