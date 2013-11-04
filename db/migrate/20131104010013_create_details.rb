class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :name, :null => false
      t.string :value, :null => false
      t.integer :pad_id, :null => false

      t.timestamps
    end
    add_index :details, :name
    add_index :details, :value
  end
end
