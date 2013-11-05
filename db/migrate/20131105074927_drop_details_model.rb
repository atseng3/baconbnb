class DropDetailsModel < ActiveRecord::Migration
  def change
    drop_table :details
    drop_table :pad_details
  end
end
