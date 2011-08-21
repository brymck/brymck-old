class ModifyKeyMoneyMonths < ActiveRecord::Migration
  def up
    change_column :apartments, :key_money_months, :integer
  end

  def down
    change_column :apartments, :key_money_months, :decimal, precision: 3, scale: 1
  end
end
