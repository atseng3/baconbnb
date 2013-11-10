class AddColumnsToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :start_date, :datetime
    add_column :bookings, :end_date, :datetime
    add_column :bookings, :status, :string
  end
end

