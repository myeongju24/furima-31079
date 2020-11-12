class ItemsController < ApplicationController
  
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:image, :explanation, :category_id, :condition_id, :delivery_fee_id, :location_id, :price, :day_to_delivery_id,).merge(user_id: current_user.id)
  end

end