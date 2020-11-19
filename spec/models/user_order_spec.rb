require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '購入情報の保存' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_order).to be_valid
    end
    it 'post_codeが空だと保存できないこと' do
      @user_order.post_code = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Post code can't be blank")
    end
    it '郵便番号にはハイフンがないと保存できないこと' do
      @user_order.post_code = '1234567'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Post code is invalid')
    end
    it 'prefecture_idが空だと保存できないこと' do
      @user_order.prefecture_id = 1
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @user_order.city = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("City can't be blank")
    end
    it 'blockが空だと保存できないこと' do
      @user_order.block = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Block can't be blank")
    end
    it 'phone_nemberが空だと保存できないこと' do
      @user_order.phone_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号には11桁以内でないと保存できないこと' do
      @user_order.phone_number = '123456789012'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号にはハイフンがあると保存できないこと' do
      @user_order.phone_number = '012-3456-7890'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Phone number is invalid')
    end
    it 'tokenが空では登録できないこと' do
      @user_order.token = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
