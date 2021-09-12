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
      end
    end
  end
