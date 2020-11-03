class ChangeColumn1OfBabysitter < ActiveRecord::Migration[6.0]
  def change
    change_column :babysitters, :experience, 'integer USING CAST(experience AS integer)'
  end
end
