class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @inventories = Inventory.all
  end
end
