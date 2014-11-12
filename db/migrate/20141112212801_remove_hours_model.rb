class RemoveHoursModel < ActiveRecord::Migration
  def change
    drop_table :hours
    add_column :restaurants, :hours, :string
  end
end
