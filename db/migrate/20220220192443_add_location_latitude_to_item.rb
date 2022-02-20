class AddLocationLatitudeToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :location_latitude, :float
  end
end
