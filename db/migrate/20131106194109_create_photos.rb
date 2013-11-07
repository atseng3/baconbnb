class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :pad_id, :null => false
      t.attachment :image

      t.timestamps
    end
  end
end
