class AddNeighborhoodToPad < ActiveRecord::Migration
  def change
    add_column :pads, :neighborhood_id, :integer
  end
end
