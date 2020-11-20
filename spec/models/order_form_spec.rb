require 'rails_helper'

describe OrderForm do

  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '購入機能' do

    context '購入がうまくいくとき' do

      it '全ての必須事項を入力すれば購入できる' do
        expect(@order_form).to be_valid
      end

      it '建物名は空でも購入できる' do
        @order_form.building = ""
        expect(@order_form).to be_valid
      end
    end

    context '購入が上手くいかない時' do
      
      it 'tokenが空だと購入できない' do
        @order_form.token = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空だと購入できない' do
        @order_form.postal_code = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号はハイフンを含んでいないと購入できない'do
        @order_form.postal_code = "1234567"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '都道府県を選択していないと購入できない' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '市区町村が空だと購入できない' do
        @order_form.city = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end

      it '電話番号が空だと購入できない' do
        @order_form.phone_number = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が全角数字だと購入できない' do
        @order_form.phone_number = "０９０１２３４５６７８"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number Input only number")
      end

      it '電話番号にハイフンが含まれていると購入できない' do
        @order_form.phone_number = "090-1234-5678"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number Input only number")
      end

      it '電話番号は11桁以内じゃないと購入できない' do
        @order_form.phone_number = "090123456789"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it 'user_idが空だと購入できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと購入できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end

    end
    
  end
end