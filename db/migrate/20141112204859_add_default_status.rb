class AddDefaultStatus < ActiveRecord::Migration
  def change
    change_column_default :reservations, :status, 0
  end
end
