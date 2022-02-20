class AddLocationFormattedAddressToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :location_formatted_address, :string
  end
end
