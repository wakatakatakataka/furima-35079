require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe User do
    describe '#create' do
      context '保存できる場合' do
        it "全ての項目の入力が存在すれば登録できること" do
          expect(@user).to be_valid
        end

        it "passwordとpassword_confirmationが６文字以上であれば登録できること" do
          @user.password = 'a123456'
          @user.password_confirmation = 'a123456'
          #binding.pry
          expect(@user).to be_valid
        end
      end

      context '保存できない場合' do
        it 'nicknameが空では登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it "passwordがない場合は登録できないこと" do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it "family_nameがない場合は登録できないこと" do
          @user.family_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end

        it "first_nameがない場合は登録できないこと" do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it "family_name_kanaがない場合は登録できないこと" do
          @user.family_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana can't be blank")
        end

        it "first_name_kanaがない場合は登録できないこと" do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end

        it "birth_dayがない場合は登録できないこと" do
          @user.birth_day = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth day can't be blank")
        end

        it "passwordが５文字以下では登録できないこと" do
          @user.password = 'a0000'
          @user.password_confirmation = 'a0000'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it "emailに@がない場合登録できないこと" do
          @user.email = "aaabbb.com"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it "重複したemailが存在する場合登録できないこと" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

        it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'family_nameが全角入力でなければ登録できないこと' do
          @user.family_name = "ｱｲｳｴｵ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name Full-width characters")
        end

        it 'first_nameが全角入力でなければ登録できないこと' do
          @user.first_name =  "ｱｲｳｴｵ"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name Full-width characters")
        end

        it 'family_name_kanaが全角カタカナでなければ登録できないこと' do
          @user.family_name_kana = "あいうえお"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana Full-width katakana characters")
        end

        it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
          @user.first_name_kana = "あいうえお"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
        end

        it 'パスワードは、半角英数字混合での入力がなければ登録できないこと' do
          @user.password = "abcdef"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
        end

        it 'パスワードは、数字のみでは登録できないこと' do
          @user.password = "12345"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
        end

        it 'パスワードは、全角では登録できないこと' do
          @user.password = "ABCDEF"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
        end
      end
    end
  end
end
