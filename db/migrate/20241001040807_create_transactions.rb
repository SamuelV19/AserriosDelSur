class CreateTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :transactions do |t|
      t.references :inventory, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :price
      t.string :buyer_or_supplier
      t.string :transaction_type

      t.timestamps
    end
  end
end
