class InventoryEntry < ApplicationRecord
  belongs_to :article
  belongs_to :employee
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :entry_date, presence: true
end