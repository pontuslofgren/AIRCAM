class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :camera, null: false, foreign_key: true
      t.references :renter, null: false, foreign_key: { to_table: :users }
      t.boolean :booked
      t.date :start_date
      t.date :end_date
      t.integer :total_cost

      t.timestamps
    end
  end
end
