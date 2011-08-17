class RemoveDefaults < ActiveRecord::Migration
  def up
    change_column_default :sources, :url, nil
  end

  def down
    change_column_default :sources, :url, "0"
  end
end
