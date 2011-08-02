class RenameUrlToDownloadForCode < ActiveRecord::Migration
  def self.up
    rename_column :code, :url, :download
  end

  def self.down
    rename_column :code, :download, :url
  end
end
