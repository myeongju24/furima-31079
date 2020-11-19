require 'rails_helper'

describe OrderForm do

  before do
    @user = FactoryBot.build(:user)
    @order_form = FactoryBot.build(:order_form)
  end

  describe '購入機能' do

    context '購入がうまくいくとき' do

      it "全ての必須事項を入力すれば購入できる" do
        expect(@order_form).to be_valid
      end
    end
    
  end

end