class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    binding.pry
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      @order_address.save
    redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code,:item_prefecture_id,:city,:address,:phone_number,:building,:order_id,:item_id).merge(user_id:current_user.id)
  end
end
