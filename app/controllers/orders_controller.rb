class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.user == current_user || !@item.order.nil?
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.item_price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :item_prefecture_id, :city, :address, :phone_number, :building).merge(
      token: params[:token], user_id: current_user.id, item_id: params[:item_id]
    )
  end
end
