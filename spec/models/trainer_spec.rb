require 'rails_helper'

RSpec.describe Trainer, type: :model do
  before do
    @trainer = FactoryBot.build(:trainer)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@trainer).to be_valid
      end
      it 'passwordは6文字以上入力されて、半角英数字であれば登録できる' do
        @trainer.password = "abcd12"
        @trainer.password_confirmation = "abcd12"
        expect(@trainer).to be_valid
      end
    end
    context "新規登録できないとき" do
      it "emailが空だと登録できない" do
        @trainer.email = ''
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空だと登録できない" do
        @trainer.password = ''
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("Password can't be blank")
      end
      it "nicknameが空だと登録できない" do
        @trainer.nickname = ''
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("Nickname can't be blank")
      end
      it "Lastnameが空だと登録できない" do
        @trainer.last_name = ''
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("Last name can't be blank")
      end
      it "firstnameが空だと登録できない" do
        @trainer.first_name = ''
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("First name can't be blank")
      end
      it "profileが空だと登録できない" do
        @trainer.profile = ''
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("Profile can't be blank")
      end
      it "passwordが5文字以下では登録できない" do
        @trainer.password = '00000'
        @trainer.password_confirmation = '00000'
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @trainer.password_confirmation = ''
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "重複したemailが存在する場合登録できない" do
        @trainer.save
        another_trainer = FactoryBot.build(:trainer, email: @trainer.email)
        another_trainer.valid?
        expect(another_trainer.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordとpassword_confirmationが不一致だと登録できない" do
        @trainer.password = 'abc123'
        @trainer.password_confirmation ='def456'
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("Password confirmation doesn't match Password")
      end 
      it "emailには@が含まれていないと登録できない" do
        @trainer.email = 'abc123.com'
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("Email is invalid")
      end
      it "first_nameは全角文字でなければ登録できない" do
        @trainer.first_name = 'abc'
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("First name is invalid")
      end
      it "last_nameは全角文字でなければ登録できない" do
        @trainer.last_name = 'abc'
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("Last name is invalid")
      end
      it "passwordは半角英数字混合でなければ登録できない" do
        @trainer.password = 'abcdef'
        @trainer.password_confirmation = 'abcdef'
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordが英語のみでは登録できない' do
        @trainer.password = 'aaaaaa'
        @trainer.password_confirmation = 'aaaaaa'
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordが数字のみでは登録できない' do
        @trainer.password = '111111'
        @trainer.password_confirmation = '111111'
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'password全角文字では登録できない' do
        @trainer.password = '１１１１１１'
        @trainer.password_confirmation = '１１１１１１'
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
    end
  end
end


