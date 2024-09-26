class InventoryExit < ApplicationRecord
  belongs_to :article
  belongs_to :employee
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :exit_date, presence: true
  has_paper_trail

end
