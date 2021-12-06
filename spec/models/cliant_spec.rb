require 'rails_helper'

RSpec.describe Cliant, type: :model do
  before do
    @cliant = FactoryBot.build(:cliant)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@cliant).to be_valid
      end
      it 'passwordは6文字以上入力されて、半角英数字であれば登録できる' do
        @cliant.password = "abcd12"
        @cliant.password_confirmation = "abcd12"
        expect(@cliant).to be_valid
      end
    end
    context "新規登録できないとき" do
      it "emailが空だと登録できない" do
        @cliant.email = ''
        @cliant.valid?
        expect(@cliant.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空だと登録できない" do
        @cliant.password = ''
        @cliant.valid?
        expect(@cliant.errors.full_messages).to include("Password can't be blank")
      end
      it "nicknameが空だと登録できない" do
        @cliant.nickname = ''
        @cliant.valid?
        expect(@cliant.errors.full_messages).to include("Nickname can't be blank")
      end
      it "Lastnameが空だと登録できない" do
        @cliant.last_name = ''
        @cliant.valid?
        expect(@cliant.errors.full_messages).to include("Last name can't be blank")
      end
      it "firstnameが空だと登録できない" do
        @cliant.first_name = ''
        @cliant.valid?
        expect(@cliant.errors.full_messages).to include("First name can't be blank")
      end
      it "profileが空だと登録できない" do
        @cliant.profile = ''
        @cliant.valid?
        expect(@cliant.errors.full_messages).to include("Profile can't be blank")
      end
      it "diet_historyが空だと登録できない" do
        @cliant.diet_history = ''
        @cliant.valid?
        expect(@cliant.errors.full_messages).to include("Diet history can't be blank")
      end
      it "passwordが5文字以下では登録できない" do
        @cliant.password = '00000'
        @cliant.password_confirmation = '00000'
        @cliant.valid?
        expect(@cliant.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @cliant.password_confirmation = ''
        @cliant.valid?
        expect(@cliant.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "重複したemailが存在する場合登録できない" do
        @cliant.save
        another_cliant = FactoryBot.build(:cliant, email: @cliant.email)
        another_cliant.valid?
        expect(another_cliant.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordとpassword_confirmationが不一致だと登録できない" do
        @cliant.password = 'abc123'
        @cliant.password_confirmation ='def456'
        @cliant.valid?
        expect(@cliant.errors.full_messages).to include("Password confirmation doesn't match Password")
      end 
      it "emailには@が含まれていないと登録できない" do
        @cliant.email = 'abc123.com'
        @cliant.valid?
        expect(@cliant.errors.full_messages).to include("Email is invalid")
      end
      it "first_nameは全角文字でなければ登録できない" do
        @cliant.first_name = 'abc'
        @cliant.valid?
        expect(@cliant.errors.full_messages).to include("First name is invalid")
      end
      it "last_nameは全角文字でなければ登録できない" do
        @cliant.last_name = 'abc'
        @cliant.valid?
        expect(@cliant.errors.full_messages).to include("Last name is invalid")
      end
      it "passwordは半角英数字混合でなければ登録できない" do
        @cliant.password = 'abcdef'
        @cliant.password_confirmation = 'abcdef'
        @cliant.valid?
        expect(@cliant.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordが英語のみでは登録できない' do
        @cliant.password = 'aaaaaa'
        @cliant.password_confirmation = 'aaaaaa'
        @cliant.valid?
        expect(@cliant.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordが数字のみでは登録できない' do
        @cliant.password = '111111'
        @cliant.password_confirmation = '111111'
        @cliant.valid?
        expect(@cliant.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'password全角文字では登録できない' do
        @cliant.password = '１１１１１１'
        @cliant.password_confirmation = '１１１１１１'
        @cliant.valid?
        expect(@cliant.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
    end
  end
end