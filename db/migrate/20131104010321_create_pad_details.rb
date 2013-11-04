class CreatePadDetails < ActiveRecord::Migration
  def change
    create_table :pad_details do |t|
      t.integer :pad_id, :null => false
      t.integer :detail_id, :null => false      

      t.timestamps
    end
  end
end
