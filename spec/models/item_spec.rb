require 'rails_helper'

describe Item do
  
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/furima-intro01.png')
  end

  describe '商品投稿' do
    context '商品投稿に成功するとき' do
      it '全ての必須項目を入力すれば投稿できる' do
        expect(@item).to be_valid
      end
    end

    context '商品投稿に失敗するとき' do
      it '画像がなければ投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'タイトルがなければ投稿できない' do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it '説明がなければ投稿できない' do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリーが--のままだと投稿できない' do
        @item.category_id  = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態が--のままだと投稿できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it '配送料の負担が--のままだと投稿できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end

      it '発送元の地域が--のままだと投稿できない' do
        @item.location_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Location must be other than 1")
      end

      it '発送までの日数が--のままだと投稿できない' do
        @item.day_to_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to delivery must be other than 1")
      end

      it '販売価格が空欄だと投稿できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '販売価格が全角だと投稿できない' do
        @item.price = 'テスト'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '販売価格が300円より安いと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end

      it '販売価格が9999999円より高いと登録できない'do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
    end

  end

end