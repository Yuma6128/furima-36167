class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
  end

  def new
  @order_address = OrderAddress.new
  end
  
  def create
    @order_address =OrderAddress.create(donation_params)
    if @order_address.valid?
      @order_address.save
    redirect_to root_path
    else
      render :new
    end
  end

  private
  def donation_params
    params.require(:order_address).permit(:postal_code,:item_prefecture_id,:city,:address,:phone_number,:building,:order_id,:item_id).merge(user_id:current_user.id)
  end
end
