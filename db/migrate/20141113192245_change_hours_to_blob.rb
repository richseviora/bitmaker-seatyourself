class ChangeHoursToBlob < ActiveRecord::Migration
  def change
    change_column :restaurants, :hours, :text
  end
end
