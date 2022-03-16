class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @order.postage = 800
    @total = 0
    if params[:order][:select_address] == "0"
      @order.delivery_postal = current_customer.postal_code
      @order.delivery_address = current_customer.address
      @order.delivery_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.delivery_postal = @address.postal_code
      @order.delivery_address = @address.address
      @order.delivery_name = @address.name
    end
  end

  def create
    # 1.注文データの保存
    @cart_items = current_customer.cart_items
    order = Order.new(order_params)
    # 1-1.postageの代入
    order.postage = 800
    # 1-3.customer_idの代入
    order.customer_id = current_customer.id
    # 1-4.total_costの代入
    @total = 0
    @cart_items.each do |cart_item|
      @total += cart_item.item.price*cart_item.amount
    end

    order.total_cost = 800 + @total.to_i
    order.save

    # 2.注文詳細データの保存
    # (カートの中身を一つ一つ取り出して、それをもとに注文詳細データを一つ一つ作成していく)
    @cart_items.each do |cart_item|
     @order_detail = OrderDetail.new
     @order_detail.order_id = order.id
     @order_detail.item_id = cart_item.item.id
     @order_detail.count = cart_item.amount
     @order_detail.cost = cart_item.amount * cart_item.item.price
     @order_detail.save
    end
    # 3.カートの中身を消す
    # (ヒント：destroy_all)
    @cart_items.destroy_all
    redirect_to orders_complete_path

  end

  def complete

  end

  def index
    @order = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_detail = @order.order_details
  end

  private

  def order_params
    params.require(:order).permit(:delivery_postal, :delivery_address, :delivery_name, :payment_method)
  end

end
