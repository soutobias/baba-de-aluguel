class Change1ColumnService < ActiveRecord::Migration[6.0]
  def change
    change_column :services, :date_time, :datetime
  end
end
