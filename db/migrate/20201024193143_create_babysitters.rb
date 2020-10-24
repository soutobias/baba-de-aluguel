class CreateBabysitters < ActiveRecord::Migration[6.0]
  def change
    create_table :babysitters do |t|
      t.text :experience
      t.decimal :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
