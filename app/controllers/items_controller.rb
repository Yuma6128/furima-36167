class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image,:item_name,:item_explain,:item_category_id,:item_sales_status_id,:item_shipping_fee_status_id,:item_prefecture_id,:item_scheduled_delivery_id,:item_price,:user)
  end
end
