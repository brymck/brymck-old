class CreateCodes < ActiveRecord::Migration
  def self.up
    create_table :codes do |t|
      t.string :title
      t.text :description
      t.string :url
      t.binary :screenshot, :limit => 2.megabytes

      t.timestamps
    end
  end

  def self.down
    drop_table :codes
  end
end
