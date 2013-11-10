class AddPriceToPad < ActiveRecord::Migration
  def change
    add_column :pads, :price, :integer
  end
end
