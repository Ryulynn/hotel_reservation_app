class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :number_of_people
      t.integer :total_fee
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
