class AddAbbreviationToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :abbr, :string, null: false, default: ""
    Exchange.reset_column_information
    change_column :exchanges, :abbr, :string, null: false
    add_index  :exchanges, :abbr, uniq: true
  end
end
