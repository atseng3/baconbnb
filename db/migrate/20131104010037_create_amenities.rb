class CreateAmenities < ActiveRecord::Migration
  def change
    create_table :amenities do |t|
      t.string :name, :null => false
      t.integer :pad_id, :null => false

      t.timestamps
    end
    add_index :amenities, :name, :uniqe => true
  end
end
