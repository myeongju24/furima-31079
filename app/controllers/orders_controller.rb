class OrdersController < ApplicationController

  def index
  end

  def create
    Order.create(order_params)
  end

  private
  def order_params
    params.permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :street, :building, :phone_number,)
  end

end
