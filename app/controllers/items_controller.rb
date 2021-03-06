class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set, only: [:show, :edit, :update, :destroy]

  def set
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @item.order.present?
      redirect_to root_path
    end
    redirect_to action: :index unless current_user.id == @item.user_id
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :content, :category_id, :status_id, :charge_id, :area_id, :term_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
