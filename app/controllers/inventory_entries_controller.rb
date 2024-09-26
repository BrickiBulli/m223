class InventoryEntriesController < ApplicationController
  before_action :require_login

  def new
    @inventory_entry = InventoryEntry.new
  end

  def create
    @inventory_entry = InventoryEntry.new(inventory_entry_params)
    if @inventory_entry.save
      redirect_to articles_path, notice: 'Inventory entry was successfully created.'
    else
      render :new
    end
  end

  def index
    @inventory_entries = InventoryEntry.all.includes(:article, :employee) # Preload associations to optimize queries
  end
  

  private

  def inventory_entry_params
    params.require(:inventory_entry).permit(:article_id, :employee_id, :quantity, :entry_date)
  end
end

