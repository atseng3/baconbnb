class CreatePads < ActiveRecord::Migration
  def change
    create_table :pads do |t|
      t.string :name, :null => false
      t.text :description, :null => false
      t.string :address, :null => false
      t.integer :owner_id, :null => false

      t.timestamps
    end
    add_index :pads, :address
  end
end
