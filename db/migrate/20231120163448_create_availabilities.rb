class CreateAvailabilities < ActiveRecord::Migration[7.1]
  def change
    create_table :availabilities do |t|
      t.date :start_date
      t.date :end_date
      t.references :camera, null: false, foreign_key: true

      t.timestamps
    end
  end
end
