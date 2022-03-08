class Public::AdressesController < ApplicationController
  def index
    @adress = Adress.new
    @adresses = Adress.all
  end

  def create
    @adress = Adress.new(adress_params)
    @adress.save
    redirect_to adresses_index_path
  end

  def edit
  end

  def destroy
    @adress = Adress.find(params[:id])
    @adress = Adress.destroy
    redirect_to adresses_index_path
  end


  private

  def adress_params
    params.require(:adress).permit(:name, :postal_code, :adress)
  end

end
