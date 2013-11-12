class AddNumGuestsToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :num_guests, :integer
  end
end
