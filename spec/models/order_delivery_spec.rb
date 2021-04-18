require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do
    buyer = FactoryBot.create(:user)
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product, user_id: user.id)
    @order_delivery = FactoryBot.build(:order_delivery, user_id: buyer.id, product_id: product.id)
    sleep(0.5)
  end

  describe OrderDelivery do
    context '保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_delivery).to be_valid
      end

      it 'building_nameがなくても保存できること' do
        @order_delivery.building_name = ''
        expect(@order_delivery).to be_valid
      end
    end

    context '保存できない場合' do
      it 'zip_codeが空だと保存できないこと' do
        @order_delivery.zip_code = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Zip code can't be blank")
      end

      it 'zip_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_delivery.zip_code = '1234567'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end

      it "shipping_area_idがない場合は登録できないこと" do
        @order_delivery.shipping_area_id = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Shipping area can't be blank")
      end

      it "shipping_area_idが未選択な場合は登録できないこと" do
        @order_delivery.shipping_area_id = 0
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Shipping area must be other than 0")
      end

      it 'cityは空では保存できないこと' do
        @order_delivery.city = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("City can't be blank")
      end

      it 'addressは空では保存できないこと' do
        @order_delivery.address = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Address can't be blank")
      end

      it 'telephoneは空では保存できないこと' do
        @order_delivery.telephone = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Telephone can't be blank")
      end

      it "telephoneが12文字以上では登録できないこと" do
        @order_delivery.telephone = '090123456789'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Telephone is invalid")
      end

      it "telephoneは半角英字では登録できないこと" do
        @order_delivery.telephone = "abcdefghijk"
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Telephone is invalid")
      end

      it "telephoneは全角では登録できないこと" do
        @order_delivery.telephone = "ABCD１１１１１１１"
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Telephone is invalid")
      end

      it "tokenが空では登録できないこと" do
        @order_delivery.token = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空では登録できないこと" do
        @order_delivery.user_id = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("User can't be blank")
      end

      it "product_idが空では登録できないこと" do
        @order_delivery.product_id = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
