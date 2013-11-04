class CreatePadAmenities < ActiveRecord::Migration
  def change
    create_table :pad_amenities do |t|
      t.integer :pad_id, :null => false
      t.integer :amenity_id, :null => false     
      
      t.timestamps
    end
  end
end
