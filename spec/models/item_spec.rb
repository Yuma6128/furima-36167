require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品登録できるとき' do
      it 'すべての値が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品登録できないとき' do
      it '画像がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品詳細がないと登録できない' do
        @item.item_explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item explain can't be blank")
      end
      it '商品カテゴリーが初期値だと登録できない' do
        @item.item_category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it '商品状態が初期値だと登録できない' do
        @item.item_sales_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status can't be blank")
      end
      it '配送料負担が初期値だと登録できない' do
        @item.item_shipping_fee_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
      end
      it '発送元の地域が初期値だと登録できない' do
        @item.item_prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture can't be blank")
      end
      it '発送までの日数が初期値だと登録できない' do
        @item.item_scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
      end
      it '価格が300円より少ないと登録できない' do
        @item.item_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than or equal to 300')
      end
      it '価格が9,999,999円より大きいと登録できない' do
        @item.item_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be less than or equal to 9999999')
      end
      it '価格は半角でないと登録できない' do
        @item.item_price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
    end
  end
end
