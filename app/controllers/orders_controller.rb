class OrdersController < ApplicationController
before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item_buy = Order_address.new(order_params)
    if @item_buy.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  # def item_params
  #   params.require(:item).permit(:title, :content, :category_id, :status_id, :charge_id, :area_id, :term_id, :price,:image).merge(user_id: params[:user_id],item_id:params[:item_id])
  # end
  def order_params
    params.require(:order_address).permit(:post_code, :area_id, :city, :address_number, :build, :telephone_number).merge(order_id: params[:order_id],user_id: params[:user_id],item_id:params[:item_id])
  end
end
