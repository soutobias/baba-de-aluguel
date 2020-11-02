class AddColumnToService < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :total_price, :numeric
  end
end
