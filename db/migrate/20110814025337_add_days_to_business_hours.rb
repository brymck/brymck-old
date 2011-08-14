class AddDaysToBusinessHours < ActiveRecord::Migration
  def change
    remove_column :business_hours, :day
    add_column :business_hours, :sunday,    :boolean, default: false
    add_column :business_hours, :monday,    :boolean, default: false
    add_column :business_hours, :tuesday,   :boolean, default: false
    add_column :business_hours, :wednesday, :boolean, default: false
    add_column :business_hours, :thursday,  :boolean, default: false
    add_column :business_hours, :friday,    :boolean, default: false
    add_column :business_hours, :saturday,  :boolean, default: false
  end
end
