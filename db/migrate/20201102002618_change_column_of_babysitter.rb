class ChangeColumnOfBabysitter < ActiveRecord::Migration[6.0]
  def change
    change_column :babysitters, :experience, 'numeric USING CAST(experience AS numeric)'
  end
end
