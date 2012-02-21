class DeleteOldCrap < ActiveRecord::Migration
  def up
    %w(addresses business_hours exchanges locations location_translations metrics metric_translations portfolios portfolios_quotes portfolio_translations quotes quotes_sources quote_translations sources).each do |table|
      drop_table table
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't recover the deleted tables"
  end
end
