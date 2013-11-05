class AddDetailColumnsToPad < ActiveRecord::Migration
  def change
    add_column :pads, :room_type, :string, :default => "Private room"
    add_column :pads, :bed_type, :string, :default => "Real Bed"
    add_column :pads, :accomodates, :integer, :default => 1
    add_column :pads, :bathrooms, :integer, :default => 1
    add_column :pads, :min_stay, :integer, :default => 1
    add_column :pads, :country, :string, :default => "United States"
    add_column :pads, :city, :string, :default => "San Francisco"
    add_column :pads, :neighborhood, :string, :default => "Marina"
    add_column :pads, :cancellation, :string, :default => "Flexible"  
  end
end
