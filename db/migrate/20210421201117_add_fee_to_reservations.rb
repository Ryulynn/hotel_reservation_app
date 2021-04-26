class AddFeeToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :fee, :integer
  end
end
