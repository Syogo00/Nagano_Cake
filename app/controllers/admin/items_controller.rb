class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @genre = @item.genres
    @item.save
    redirect_to admin_item_path
  end

  def show
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :genre_id, :price)
  end

end
