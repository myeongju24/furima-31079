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
  end

end