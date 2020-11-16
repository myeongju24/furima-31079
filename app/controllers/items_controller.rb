class ItemsController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_item, only: [:show, :destroy]
  def index
    @items = Item.order("created_at DESC")
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

  def destroy
    if current_user == @item.user
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :explanation, :category_id, :condition_id, :delivery_fee_id, :location_id, :price, :day_to_delivery_id,).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

end