class ChangeColumnmOfBabysitter < ActiveRecord::Migration[6.0]
  def change
    rename_column :services, :date_time, :start_date
    change_column :services, :start_date, :date
    add_column :services, :end_date, :date
  end
end
