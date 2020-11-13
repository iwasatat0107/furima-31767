require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品の出品' do
      context '商品が出品できる場合' do
        it '画像と各テキストがあれば商品は出品される' do
          expect(@item).to be_valid
        end
      end

      context '商品が出品できない場合' do
        it 'imageがないと商品は出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'nameがないと商品は出品できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'textがないと商品は出品できない' do
          @item.text = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Text can't be blank")
        end
        it 'categoryがないと商品は出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end
        it 'conditionがないと商品は出品できない' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Condition must be other than 1')
        end
        it 'postage_payがないと商品は出品できない' do
          @item.postage_pay_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Postage pay must be other than 1')
        end
        it 'prefectureがないと商品は出品できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
        end
        it 'shipping_dayがないと商品は出品できない' do
          @item.shipping_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping day must be other than 1')
        end
        it 'priceがないと商品は出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'priceが299円以下だと商品は出品できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        end
        it 'priceが9,999,999円以上だと商品は出品できない' do
          @item.price = 100000000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end
        it 'priceが半角数字意外だと商品は出品できない' do
          @item.price = '９９９'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end
      end
    end
  end
end
