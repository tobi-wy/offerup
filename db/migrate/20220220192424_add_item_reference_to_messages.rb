class AddItemReferenceToMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :messages, :items
    add_index :messages, :item_id
    change_column_null :messages, :item_id, false
  end
end
