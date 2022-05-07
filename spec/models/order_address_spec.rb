require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '配送先入力の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'address2は空でも保存できること' do
        @order_address.address2 = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      
       it 'user_idが空だと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
       end
       it 'item_idが空だと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
       end

       it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
       end
       it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
       end
       it 'prefectureを選択していないと保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
       end
       it 'ctiyが空だと保存できないこと' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
       end
       it 'address1が1空だと保存できないこと' do
        @order_address.address1 = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address1 can't be blank")
       end
       it '電話番号が空だと保存できないこと' do
        @order_address.phone = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
       end
       it '電話番号が9桁以下だと保存できないこと' do
        @order_address.phone = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
       end
       it '電話番号が12桁以上だと保存できないこと' do
        @order_address.phone = '012345678912'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
       end
       it '電話番号が全角だと保存できないこと' do
        @order_address.phone = '１２３４５６７８９０１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
       end
       it '電話番号にハイホンがあると保存できないこと' do
        @order_address.phone = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
       end
     end
  end
end


