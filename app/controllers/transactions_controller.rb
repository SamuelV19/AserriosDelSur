class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_moderator_role

  def index
    @transactions = Transaction.all
  end

  def new
    @transaction = Transaction.new
    @inventories = Inventory.all
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to transactions_path, notice: 'Transacción creada exitosamente.'
    else
      render :new
    end
  end

  private

  def check_moderator_role
    unless current_user.has_role?(:moderator)
      redirect_to root_path, alert: 'No tienes permiso para acceder a esta sección.'
    end
  end

  def transaction_params
    params.require(:transaction).permit(:inventory_id, :quantity, :price, :buyer_or_supplier, :transaction_type)
  end
end
