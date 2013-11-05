class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :name, :null => false
      t.text :description, :null => false
      
      t.timestamps
    end
    add_index :neighborhoods, :name
  end
end
