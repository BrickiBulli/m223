class InventoryExitsController < ApplicationController
  before_action :require_login

  def new
    @inventory_exit = InventoryExit.new
  end

  def create
    @inventory_exit = InventoryExit.new(inventory_exit_params)
    if @inventory_exit.save
      redirect_to articles_path, notice: 'Inventory exit was successfully created.'
    else
      render :new
    end
  end

  def index
    @inventory_exits = InventoryExit.all.includes(:article, :employee) # Preload associations to optimize queries
  end

  private

  def inventory_exit_params
    params.require(:inventory_exit).permit(:article_id, :employee_id, :quantity, :exit_date)
  end
end
