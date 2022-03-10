class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @genre = @item.genre
    @cart_items = CartItem.new
  end
end
