require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品登録ができるとき' do
      it '全ての入力が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品ができないとき' do
      it 'item_nameが空では登録できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_infoが空では登録できない' do
        @item.item_info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end

      it 'item_category_idが空では登録できない' do
        @item.item_category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end

      it 'sale_status_idが空では登録できない' do
        @item.sale_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sale status can't be blank")
      end

      it 'shipping_fee_idが空では登録できない' do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'scheduled_delivery_idが空では登録できない' do
        @item.scheduled_delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end

      it 'userが空だと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it 'imageがないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      end

      it '価格の範囲が、300円未満だと出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格の範囲が、9,999,999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
