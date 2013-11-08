class AddNameOfAttrForFilepickerUrlToPad < ActiveRecord::Migration
  def up
    add_column :pads, :filepicker_url, :string
  end

  def down
    remove_column :pads, :filepicker_url
  end
end
