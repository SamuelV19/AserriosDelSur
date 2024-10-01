class Transaction < ApplicationRecord
  belongs_to :inventory

  after_create :update_inventory_stock

  validates :quantity, presence: true
  validates :price, presence: true
  validates :buyer_or_supplier, presence: true
  validates :transaction_type, inclusion: { in: ['purchase', 'sale'] }

  private

  def update_inventory_stock
    if transaction_type == 'purchase'
      inventory.stock += quantity
    elsif transaction_type == 'sale'
      inventory.stock -= quantity
    end
    inventory.save
  end

  def self.total_profit
    where(transaction_type: 'sale').sum('price * quantity')
  end

  def self.ransackable_attributes(auth_object = nil)
    ["buyer_or_supplier", "created_at", "id", "id_value", "inventory_id", "price", "quantity", "transaction_type", "updated_at"]
  end
end
