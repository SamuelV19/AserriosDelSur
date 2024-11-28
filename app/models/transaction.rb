class Transaction < ApplicationRecord
  belongs_to :inventory

  after_create :update_inventory_stock

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: true
  validates :buyer_or_supplier, presence: true
  validates :transaction_type, inclusion: { in: ['purchase', 'sale'] }

  private

  # Actualiza el stock del inventario después de la transacción
  def update_inventory_stock
    if inventory
      # Actualiza el stock dependiendo del tipo de transacción
      if transaction_type == 'purchase'
        inventory.stock += quantity
      elsif transaction_type == 'sale'
        inventory.stock -= quantity
      end

      # Guarda los cambios del inventario solo si es necesario
      inventory.save! if inventory.changed?
    end
  end

  # Método para calcular el beneficio total de las ventas
  def self.total_profit
    where(transaction_type: 'sale').sum('price * quantity')
  end

  # Define los atributos permitidos para búsquedas con Ransack
  def self.ransackable_attributes(auth_object = nil)
    ["buyer_or_supplier", "created_at", "id", "inventory_id", "price", "quantity", "transaction_type", "updated_at"]
  end
end
