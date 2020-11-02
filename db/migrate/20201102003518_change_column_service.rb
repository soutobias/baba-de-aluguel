class ChangeColumnService < ActiveRecord::Migration[6.0]
  def change
    rename_column :services, :start_date, :date_time
    remove_column :services, :end_date
  end
end
