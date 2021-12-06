require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿' do
    context '投稿できる場合' do
      it '全ての項目が入力されていれば投稿ができる' do
        expect(@post).to be_valid
      end
    end
    context '投稿できない場合' do
      it 'タイトルが空だと投稿できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it '日付が空だと投稿できない' do
        @post.date = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Date can't be blank")
      end
      it "説明文が空だと登録できない" do
        @post.explanation = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Explanation can't be blank")
      end
      it "画像が存在していないと投稿できない" do
        @post.images = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Images can't be blank")
      end
    end
  end
end
