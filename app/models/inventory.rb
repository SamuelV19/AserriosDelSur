class Inventory < ApplicationRecord
  has_many :transactions

  validates :name, presence: true
  validates :stock, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: true

  def self.ransackable_attributes(auth_object = nil)

    ["created_at", "id", "name", "price", "stock", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["transactions"]
  end
end
