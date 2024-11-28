class AddTotalPriceToTransactions < ActiveRecord::Migration[7.2]
  def change
    add_column :transactions, :total_price, :decimal
  end
end
