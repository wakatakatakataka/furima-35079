require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    user = FactoryBot.create(:user)
    @product = FactoryBot.build(:product, user_id: user.id)
  end

  describe Product do
    describe '#create' do
      context '保存できる場合' do
        it "全ての項目の入力が存在すれば登録できること" do
          expect(@product).to be_valid
        end

        it "priceが9999999だと登録できる" do
          @product.price = '9999999'
          expect(@product).to be_valid
        end
      end

      context '保存できない場合' do
        it 'imageが空では登録できない' do
          @product.image = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Image can't be blank")
        end

        it 'nameが空では登録できない' do
          @product.name = ''
          @product.valid?
          expect(@product.errors.full_messages).to include("Name can't be blank")
        end

        it "descriptionがない場合は登録できないこと" do
          @product.description = ''
          @product.valid?
          expect(@product.errors.full_messages).to include("Description can't be blank")
        end

        it "category_idがない場合は登録できないこと" do
          @product.category_id = ''
          @product.valid?
          expect(@product.errors.full_messages).to include("Category can't be blank")
        end

        it "category_idが未選択な場合は登録できないこと" do
          @product.category_id = 0
          @product.valid?
          expect(@product.errors.full_messages).to include("Category must be other than 0")
        end

        it "condition_idがない場合は登録できないこと" do
          @product.condition_id = ''
          @product.valid?
          expect(@product.errors.full_messages).to include("Condition can't be blank")
        end

        it "condition_idが未選択な場合は登録できないこと" do
          @product.condition_id = 0
          @product.valid?
          expect(@product.errors.full_messages).to include("Condition must be other than 0")
        end

        it "shipping_change_idがない場合は登録できないこと" do
          @product.shipping_change_id = ''
          @product.valid?
          expect(@product.errors.full_messages).to include("Shipping change can't be blank")
        end

        it "shipping_change_idが未選択な場合は登録できないこと" do
          @product.shipping_change_id = 0
          @product.valid?
          expect(@product.errors.full_messages).to include("Shipping change must be other than 0")
        end

        it "shipping_area_idがない場合は登録できないこと" do
          @product.shipping_area_id = ''
          @product.valid?
          expect(@product.errors.full_messages).to include("Shipping area can't be blank")
        end

        it "shipping_area_idが未選択な場合は登録できないこと" do
          @product.shipping_area_id = 0
          @product.valid?
          expect(@product.errors.full_messages).to include("Shipping area must be other than 0")
        end

        it "delivery_time_idがない場合は登録できないこと" do
          @product.delivery_time_id = ''
          @product.valid?
          expect(@product.errors.full_messages).to include("Delivery time can't be blank")
        end

        it "delivery_time_idが未選択な場合は登録できないこと" do
          @product.delivery_time_id = 0
          @product.valid?
          expect(@product.errors.full_messages).to include("Delivery time must be other than 0")
        end

        it "priceがない場合は登録できないこと" do
          @product.price = ''
          @product.valid?
          expect(@product.errors.full_messages).to include("Price can't be blank")
        end

        it "priceは半角英字では登録できないこと" do
          @product.price = "abcd"
          @product.valid?
          expect(@product.errors.full_messages).to include("Price is not a number")
        end

        it "priceは全角では登録できないこと" do
          @product.price = "ABCD１１１"
          @product.valid?
          expect(@product.errors.full_messages).to include("Price is not a number")
        end

        it "priceが299だと登録できない" do
          @product.price = '299'
          @product.valid?
          expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
        end

        it "priceが10000000だと登録できない" do
          @product.price = '10000000'
          @product.valid?
          expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
      end
    end
  end
end