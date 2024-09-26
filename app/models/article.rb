class Article < ApplicationRecord
    has_many :inventory_entries
    has_many :inventory_exits
    validates :name, presence: true
    validates :article_number, presence: true, uniqueness: true
    validates :weight, numericality: { greater_than: 0 }
    
    def current_stock
        total_entries = inventory_entries.sum(:quantity)
        total_exits = inventory_exits.sum(:quantity)
        total_entries - total_exits
      end
  end
