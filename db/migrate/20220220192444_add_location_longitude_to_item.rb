class AddLocationLongitudeToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :location_longitude, :float
  end
end
