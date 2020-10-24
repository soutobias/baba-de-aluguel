class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.references :user, null: false, foreign_key: true
      t.references :babysitter, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :duration

      t.timestamps
    end
  end
end
