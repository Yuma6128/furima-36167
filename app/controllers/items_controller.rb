class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user == current_user
      render 'edit'
      else
        redirect_to item_path
      end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
      else
        render 'edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_explain, :item_category_id, :item_sales_status_id,
                                 :item_shipping_fee_status_id, :item_prefecture_id, :item_scheduled_delivery_id, :item_price).merge(user_id: current_user.id)
  end
end
