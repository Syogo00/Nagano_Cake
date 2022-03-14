class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.delivery_postal = current_customer.postal_code
      @order.delivery_address = current_customer.address
      @order.delivery_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
    else
      @address = Order.new(order_params)
    end
    # binding.pry
  end

  def create

  end

  def complete
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:delivery_postal, :delivery_address, :delivery_name, :payment_method)
  end

end
