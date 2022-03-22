class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @cart_item = current_customer.cart_items
  end

  def create
    @cart_items = current_customer.cart_items
    @cart_item = @cart_items.find_by(item: params[:item_id])
    if @cart_item
      @cart_item.update(amount: params[:amount].to_i+@cart_item.amount)
    else
      @cart_item = CartItem.new
      @cart_item.amount=params[:amount]
      @cart_item.item_id=params[:item_id]
      @item = @cart_item.item
      @cart_item.customer_id = current_customer.id
      @cart_item.save
    end
    redirect_to cart_items_path
  end


  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_item = CartItem.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end
