class AddTagLineToNeighborhood < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :tag_line, :text
  end
end
