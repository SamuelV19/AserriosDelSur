class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
  end

  def inventory_params
    params.require(:inventory).permit(:name, :stock, :price, :image)
  end
end
