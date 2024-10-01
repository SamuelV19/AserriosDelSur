class CreateInventories < ActiveRecord::Migration[7.2]
  def change
    create_table :inventories do |t|
      t.string :name
      t.integer :stock
      t.float :price

      t.timestamps
    end
  end
end
