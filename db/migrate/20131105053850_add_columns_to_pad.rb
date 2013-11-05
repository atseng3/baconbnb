class AddColumnsToPad < ActiveRecord::Migration
  def change
    add_column :pads, :latitude, :string
    add_column :pads, :longitude, :string
  end
end
