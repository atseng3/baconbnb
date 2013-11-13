class ChangeFilePickerUrlType < ActiveRecord::Migration
  def change
    change_column :pads, :filepicker_url, :text
  end
end
