class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :street, :building, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  #"order_form"=>{"postal_code"=>"497-0056", "prefecture_id"=>"24", "city"=>"海部郡蟹江町", "street"=>"八幡1-45-3", "building"=>"", "phone_number"=>"09056373939"},
 #"token"=>"tok_5c9e9e803b113424c0b8455e6224",
 #"item_id"=>"28"}


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
