class AddUrlToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :url, :text, :null => false
  end
end
