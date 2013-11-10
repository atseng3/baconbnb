class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.text :filename, :null => false
      t.text :mimetype, :null => false
      t.integer :size, :null => false
      t.integer :pad_id, :null => false
      t.timestamps
    end
  end
end
