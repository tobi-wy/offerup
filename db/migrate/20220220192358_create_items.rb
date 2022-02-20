class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.string :photo
      t.string :location
      t.integer :category_id
      t.integer :price
      t.boolean :status

      t.timestamps
    end
  end
end
