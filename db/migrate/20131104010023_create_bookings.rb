class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :booker_id, :null => false
      t.integer :pad_id, :null => false

      t.timestamps
    end
  end
end
