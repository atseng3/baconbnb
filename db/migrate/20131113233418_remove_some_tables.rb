class RemoveSomeTables < ActiveRecord::Migration
  def change
    drop_table :photos
    drop_table :pad_amenities
  end
end
