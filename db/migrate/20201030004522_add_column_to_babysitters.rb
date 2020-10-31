class AddColumnToBabysitters < ActiveRecord::Migration[6.0]
  def change
    add_column :babysitters, :skill, :string
  end
end
